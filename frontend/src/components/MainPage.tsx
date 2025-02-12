import { Paper } from "@mui/material";
import ImageList from "@mui/material/ImageList";
import ImageListItem from "@mui/material/ImageListItem";
import gsap from "gsap";
import { useEffect, useRef } from "react";
function srcset(image: string, size: number, rows = 1, cols = 1) {
  return {
    src: `${image}?w=${size * cols}&h=${size * rows}&fit=crop&auto=format`,
    srcSet: `${image}?w=${size * cols}&h=${
      size * rows
    }&fit=crop&auto=format&dpr=2 2x`,
  };
}

const MainPage = () => {

  const paperRef=useRef(null)

  useEffect(() => {
    gsap.fromTo(paperRef.current, 
      { opacity: 0,  y: -50 }, 
      { opacity: 1,  y:0,duration: 1 }
    );
  }, []);


  const itemData = [
    {
      img: "https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-necklace-with-an-elegant-pendant.webp",

      title: "jewelery",
      rows: 3,
      cols: 2,
    },
    {
      img: "https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-ring-with-a-diamond.webp",
    },
    {
      img: "https://aurora-gem.s3.eu-north-1.amazonaws.com/gold_rose_brooch.png",
    },
    {
      img: "https://aurora-gem.s3.eu-north-1.amazonaws.com/women's-diamond-watch.webp",

      cols: 2,
      rows: 3,
    },
    {
      img: "https://aurora-gem.s3.eu-north-1.amazonaws.com/diamond-stud-earrings.webp",

      cols: 2,
      rows: 2,
    },
    {
      img: "https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-ring-with-a-vibrant-red-ruby.webp",

      rows: 3,
      cols: 2,
    },
    {
      img: "https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-pendant-with-sapphire.webp",

      cols: 2,
      rows: 3,
    },
  ];
  return (
    <Paper ref={paperRef} className="flex flex-col items-center justify-center bg-slate-50 m-4 p-8 w-full max-w-full">
      <h1 className=" text-md lg:text-5xl font-serif italic font-light  underline-offset-8 w-full text-center">
        Inspired by the Aurora, Designed for You.{" "}
      </h1>
      <div className="hidden lg:block p-3 ">
        <ImageList
          sx={{ width: 1000, height: 1200, overflow: "hidden" }}
          variant="quilted"
          cols={4}
          rowHeight={121}
          className="p-4"
        >
          {itemData.map((item) => (
            <ImageListItem
              key={item.img}
              cols={item.cols || 1}
              rows={item.rows || 1}
                className="border-2 border-slate-700 px-2 transition ease-in-out delay-150 hover:scale-110 hover:rounded-md  "
            >
              <img
                {...srcset(item.img, 121, item.rows, item.cols)}
                alt={item.title}
                className="rounded-md"
                loading="lazy"
              />
            </ImageListItem>
          ))}
        </ImageList>
      </div>
      <div className="lg:hidden w-fit flex flex-wrap gap-y-4 md:p-4 justify-center">
        <img 
          className="w-[100%] hover:scale-110 transition ease-in-out delay-150 rounded-md" 
          src="https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-necklace-with-an-elegant-pendant.webp"
          alt="jewelery"
        />
        <img 
          className="w-[100%] hover:scale-110 transition ease-in-out delay-150 rounded-md" 
          src="https://aurora-gem.s3.eu-north-1.amazonaws.com/gold-ring-with-a-diamond.webp"
          alt="jewelery"
        />
        <img
          className="w-[100%] hover:scale-110 transition ease-in-out delay-150 rounded-md" 
          src="https://aurora-gem.s3.eu-north-1.amazonaws.com/gold_rose_brooch.png"
          alt="jewelery"
        />
        <img
          className="w-[100%] hover:scale-110 transition ease-in-out delay-150 rounded-md" 
          src="https://aurora-gem.s3.eu-north-1.amazonaws.com/women's-diamond-watch.webp"
          alt="jewelery"
        />
        <img
          className="w-[100%] hover:scale-110 transition ease-in-out delay-150 rounded-md" 
          src="https://aurora-gem.s3.eu-north-1.amazonaws.com/silver-ring-with-a-vibrant-red-ruby.webp"
          alt="jewelery"
        />
      </div>
    </Paper>
  );
};

export default MainPage;
