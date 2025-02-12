import { Divider } from "@mui/material";
import OrdersHistoryList from "./OrdersHistoryList";
import authAPI from "../../helpers/authAPI";
import { useEffect, useState,useRef } from "react";
import OrderDto from "./interfaces/OrderDto";
import userAuthenticated from "../../helpers/userAuthenticated";
import getCustomerInfo from "../../helpers/getCustomerInfo";
import gsap from "gsap";


export default function OrderHistory() {
  const [orderHistory, setOrderHistory] = useState<OrderDto[]>([]);
  useEffect(() => {
    const fetchCustomerOrders = async ()=>{
        const customer = getCustomerInfo()
        try {
            if(!userAuthenticated()){
                console.error("User is not logged in");
                return
            }
            const res = await authAPI.get("http://localhost:3002/orders/customer");
            console.log(res.data.result)
            if (res && res.data.result) {
              return setOrderHistory(res.data.result);
            }
          } catch (error) {
            console.error(`Error in fetching order history for customer: ${customer?customer.email:'--'}:`, error);
          }
    }
    fetchCustomerOrders()
  }, []);

  const listRef=useRef(null)
  useEffect(() => {
    gsap.fromTo(listRef.current, 
      { opacity: 0,  x: -30 }, 
      { opacity: 1,  x:0,duration: .5 }
    );
  }, []);
  return (
    <div ref={listRef} className="m-2 flex flex-col gap-2">
      <div className="font-4xl">Your order history</div>
      <Divider />
      <div>
        {orderHistory && orderHistory.length>0 ? (
          <OrdersHistoryList orders={orderHistory} />
        ) : (
          <div className="font-2xl">No orders have been made yet by you</div>
        )}
      </div>
    </div>
  );
}
