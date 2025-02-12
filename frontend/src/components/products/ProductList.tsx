import { useEffect, useState,useRef } from "react";

import ProductDto from "./dto/ProductDto";
import ProductCard from "./ProductCard";
import authAPI from "../../helpers/authAPI";
import { useParams } from "react-router-dom";
import gsap from "gsap";


export default function ProductList() {
  const { categoryName } = useParams();
  const [products, setProducts] = useState<ProductDto[]>();
  useEffect(() => {
    authAPI.get(`http://localhost:3001/products/category/${categoryName}`).then((res) => {
      if (res && res.data.result) setProducts(res.data.result);
    });
  }, [categoryName]);

  const listRef=useRef(null)

  useEffect(() => {
    gsap.fromTo(listRef.current, 
      { opacity: 0,  x: -30 }, 
      { opacity: 1,  x:0,duration: .5 }
    );
  }, [categoryName]);


  return (
    <div ref={listRef} className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
      {products ? (
        products.map((p, index) => {
          return (
            <div key={index}>
                <ProductCard product={p} />
            </div>
          );
        })
      ) : (
        <p>Loading...</p>
      )}
    </div>
  );
}
