import { Divider } from "@mui/material";
import OrderHistoryCard from "./OrderHistoryCard";
import OrderDto from "./interfaces/OrderDto";



export default function OrdersHistoryList({orders}:{orders:OrderDto[]}){
  
  return (
    <div>
      <div  className="flex flex-col gap-y-8 w-full max-w-full">
        {orders.map((order, index) => {
          return (
            <div key={index}>
              <OrderHistoryCard order={order} />
              <Divider/>
            </div>
          );
        })}
      </div>

    </div>)
}