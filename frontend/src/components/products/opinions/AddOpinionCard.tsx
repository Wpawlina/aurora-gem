import {
  Button,
  FormControl,
  InputLabel,
  OutlinedInput,
  Paper,
  Rating,
} from "@mui/material";
import { useCallback, useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { OpinionDto, mapToOpinionDto } from "./dto/OpinionDto";
import authAPI from "../../../helpers/authAPI";
import userAuthenticated from "../../../helpers/userAuthenticated";

export default function AddOpinionCard() {
  const { id } = useParams();
  const [stars, setStars] = useState<number>(0);
  const [content, setContent] = useState<string>("");
  const [opinionAdded, setOpinionAdded] = useState<boolean>(false);
  const [loading, setLoading] = useState<boolean>(false);

  const userOpinion = useCallback(async () => {
    if (userAuthenticated()) {
      try {
        const res = await authAPI.get(`http://localhost:3003/opinions/customer/`);
        const opinions: OpinionDto[] = res.data.result;
        setOpinionAdded(opinions.some((op) => op.productId === parseInt(id!)));
      } catch (err) {
        console.error(err);
      }
    }
  }, [id]);

  useEffect(() => {
    userOpinion();
  }, [userOpinion]);

  async function onSubmitClick() {
    if (!stars || content.trim().length === 0) return;

    setLoading(true);
    try {
      const opinion = mapToOpinionDto(null, stars, content, Number(id));
      await authAPI.post(`http://localhost:3003/opinions/`, opinion);
      setOpinionAdded(true);
    } catch (error) {
      console.error(error);
    }
    setLoading(false);
  }

  return (
    <>
      {!opinionAdded ? (
        <Paper className="md:p-4 p-6 flex flex-col gap-4 md:w-full w-96">
          <Rating
            name="stars-opinion"
            value={stars}
            onChange={(_, val) => setStars(val ? val : 0)}
            className="self-center"
          />
          <FormControl className="w-full ">
            <InputLabel htmlFor="component-outlined">Opinion</InputLabel>
            <OutlinedInput
              id="component-outlined"
              label="Opinion"
              multiline
              rows={4}
              fullWidth
              onChange={(event: React.ChangeEvent<HTMLInputElement>) =>
                setContent(event.target.value)
              }
            />
          </FormControl>
          <Button
            className="h-12 text-lg"
            variant="contained"
            onClick={onSubmitClick}
            disabled={loading || stars === 0 || content.trim().length === 0}
          >
            {loading ? "Submitting..." : "Submit"}
          </Button>
        </Paper>
      ) : (
        <div className="text-xl sm:text-2xl m-4 text-center">
          You have already submitted your opinion.
        </div>
      )}
    </>
  );
}
