import axios, { AxiosRequestConfig, AxiosError,InternalAxiosRequestConfig } from 'axios';


interface RefreshTokenResponse {
  accessToken: string;
 
}


interface CustomAxiosRequestConfig extends AxiosRequestConfig {
    _retry?: boolean;
  }

const authAPI = axios.create({
  
  headers: {
    'Content-Type': 'application/json',
  },
});

let refreshTokenRequest: Promise<RefreshTokenResponse> | null = null;

const handleUnauthenticated = () => {

  localStorage.removeItem('accessToken');
  localStorage.removeItem('refreshToken');
  
  window.location.replace('/login');
};





authAPI.interceptors.request.use(
  (config: InternalAxiosRequestConfig) => {
    // console.log("Wysyłanie żądania do:", config.url);
    const accessToken = localStorage.getItem('accessToken');
    // console.log('Pobieranie accessToken z localStorage:', accessToken);
    
    if (accessToken) {
      config.headers.set('Authorization', `Bearer ${accessToken}`);
      // console.log('Zaktualizowane nagłówki:', config.headers);
     
    } 
    // else {
    //   console.warn('Brak accessToken w localStorage!');
    // }

    return config;
  },
  (error: AxiosError) => {
  //  console.error('Błąd w interceptorze request:', error);
    return Promise.reject(error);
  }
);



authAPI.interceptors.response.use(
  (response) => {
    
    // console.log('response', response);
    return response},
  async (error: AxiosError) => {
    const originalRequest = error.config as CustomAxiosRequestConfig;
    // console.log('error', error);

    // Sprawdź, czy mamy do czynienia z błędem 401 (Unauthorized) lub 403 (Forbidden)
    if ((error.response?.status === 401 || error.response?.status === 403) && originalRequest && !originalRequest._retry) {
      // console.warn('Błąd 401/403, próbujemy odświeżyć token...');

      originalRequest._retry = true;

      if (!refreshTokenRequest) {
        const refreshToken = localStorage.getItem('refreshToken');
        if (!refreshToken) {
          // console.error('Brak refresh tokena w localStorage, wylogowanie...');
          handleUnauthenticated();
          return Promise.reject(error);
        }

        // Wysyłanie żądania odświeżenia tokena
        refreshTokenRequest = axios.post<RefreshTokenResponse>(
          'http://localhost:3030/api/refresh',
          { refreshToken: refreshToken }
        ).then((response) => response.data)
        .catch(refreshError => {
          // console.error('Błąd podczas odświeżania tokena:', refreshError);
          refreshTokenRequest = null;
          handleUnauthenticated();
          return Promise.reject(refreshError);
        });
      }

      try {
        const data = await refreshTokenRequest;
        refreshTokenRequest = null;

        // console.log('Nowy access token:', data.accessToken);

        // Zapisujemy nowy access token
        localStorage.setItem('accessToken', data.accessToken);

        // Ustawiamy nowy token w nagłówku
        originalRequest.headers!.Authorization = `Bearer ${data.accessToken}`;

        // Ponawiamy oryginalne żądanie
        return authAPI(originalRequest);
      } catch (refreshError: any) {
        refreshTokenRequest = null;
        // console.error('Nie udało się odświeżyć tokena:', refreshError);

        if (refreshError.response?.status === 401 || refreshError.response?.status === 403) {
          handleUnauthenticated();
        }

        return Promise.reject(refreshError);
      }
    }

    return Promise.reject(error);
  }
);



export default authAPI;