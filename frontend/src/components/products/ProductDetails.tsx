import { useEffect, useState,useRef } from "react";
import { useParams } from "react-router-dom";
import authAPI from "../../helpers/authAPI";
import ProductDto from "./dto/ProductDto";
import OpinionList from "./opinions/OpinionList";
import { Alert, Box, Button, Divider, Paper, TextField } from "@mui/material";
import AddOpinionCard from "./opinions/AddOpinionCard";
import gsap from "gsap";


interface AlertInfo {
  showSuccess: boolean;
  showInfo: boolean;
  showError: boolean;
  message: string;
}
export default function ProductDetails() {
  const { id } = useParams();
  const [product, setProduct] = useState<ProductDto>();
  const [orderValue,setOrderValue] = useState<number>(1)
    const [showAlert, setShowAlert] = useState<AlertInfo>({
      showSuccess: false,
      showInfo: false,
      showError: false,
      message:""
    });
  const paperRef=useRef(null)

  
  useEffect(() => {
    authAPI.get(`http://localhost:3001/products/${id}`).then((res) => {
      if (res && res.data.result) setProduct(res.data.result);
    });
  }, [id]);

  useEffect(() => {
    gsap.fromTo(paperRef.current, 
      { opacity: 0,  y: -30 }, 
      { opacity: 1,  y:0,duration: .5 }
    );
  }, []);


  const handleOnAddToCart = ()=>{
      if(orderValue>0){
        let cartValue:number = orderValue
        if(localStorage.getItem(`cart-item-${product?.productId}`)){
          cartValue+= Number(localStorage.getItem(`cart-item-${product?.productId}`))
        }
        if(product && cartValue>product?.availableQuantity){
          setShowAlert({
            showSuccess: false,
            showInfo: false,
            showError: true,
            message: "You  wanted to added to many items to cart",
          });
          return
        }
        setShowAlert({
          showSuccess: false,
          showInfo: true,
          showError: false,
          message:`Added to cart ${orderValue} items of ${product?.name}`,
        });
  
        localStorage.setItem(`cart-item-${product?.productId}`,cartValue.toString())
        setOrderValue(1)
      }
  }
  return (<>
    {showAlert.showInfo && (
      <Alert
        variant="outlined"
        severity="info"
        onClose={() => setShowAlert({ ...showAlert, showInfo: false })}
      >
        {showAlert.message}
      </Alert>
    )}
    {showAlert.showError && (
      <Alert
        variant="outlined"
        severity="error"
        onClose={() => setShowAlert({ ...showAlert, showError: false })}
      >
        {showAlert.message}
      </Alert>
    )}
    <Paper ref={paperRef} className="flex  flex-col items-center justify-center w-fit max-w-full p-2 md:p-16">
      <Paper>
        <div className="flex flex-col sm:flex-col md:flex-row items-center p-4 sm:p-6 md:p-8 min-h-96 justify-center w-full max-w-full">
          <Box className="m-4 border rounded-md border-slate-700 shadow-lg overflow-hidden ">
            <img
              className="w-full max-w-[350px] h-auto object-cover rounded-md scale-105 "
              src={product?.images[0].url}
              alt={product?.name}
            />
          </Box>
          <div className="flex flex-col gap-4">
            <div>
              <div className="text-3xl font-bold m-4">{product?.name}</div>
              <div className="text-xl font-bold italic m-2">
                {product?.price} $
              </div>
              <div className="flex flex-col gap-2 items-center">
                <Button variant="outlined" className="w-full sm:w-fit" onClick={handleOnAddToCart}>Add to cart</Button>
                <TextField
                        type="number"
                        slotProps={{
                          htmlInput: { 
                              max: product ? product.availableQuantity : 1, min: 1 ,
                          }
                      }}
                        defaultValue={1}
                        value={orderValue}
                        onChange={(value)=>setOrderValue(Number(value.target.value))}
                        className="!w-full sm:!w-20"
                        variant="outlined"
                        disabled={product?product.availableQuantity===0:false }
                      />
                <div className="m-2">
                  Only left:{" "}
                  <span className="font-bold">
                    {product?.availableQuantity}
                  </span>
                </div>
              </div>
            </div>
            <Divider />
            <div>
              <div>{product?.shortDescription}</div>
            </div>
          </div>
        </div>
        <Divider className="mx-2" />
        <section className="m-4">{product?.description}</section>
      </Paper>

      <Divider className="m-4" />
      <div className="flex flex-col items-center justify-center w-full max-w-full gap-y-8">
        <AddOpinionCard />
        <OpinionList />
      </div>
    </Paper>
    </>
  );
}
