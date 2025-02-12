import {useRef, useEffect} from 'react';
import gsap from 'gsap';


const NotFoundPage = () => {
    const notFoundRef = useRef(null);
    useEffect(() => {
        gsap.fromTo(notFoundRef.current, { opacity: 0, x: -30 }, { opacity: 1, x: 0, duration: 0.5 });
    }, []);

    return (
        <div ref={notFoundRef}>
            <h1 className="text-6xl">Ups... Not Found!</h1>
            <img src="/src/assets/logoupsidedown.png" alt="404" />
        </div>
    )
}


export default NotFoundPage;