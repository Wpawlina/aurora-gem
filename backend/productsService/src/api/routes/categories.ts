import { Router} from "express";
import { getAll } from "../../api/controllers/categories";

export const categoriesRouter = Router();

categoriesRouter.get("/", async (_, res) => {
  console.log('get all categories')
  const result = await getAll();
  res.status(200).json({ result });
});
