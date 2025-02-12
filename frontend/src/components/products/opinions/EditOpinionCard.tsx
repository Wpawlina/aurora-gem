import {
  Button,
  FormControl,
  InputLabel,
  OutlinedInput,
  Paper,
  Rating,
} from "@mui/material";
import { useState } from "react";
import { useParams } from "react-router-dom";
import { OpinionDto, mapToOpinionDto } from "./dto/OpinionDto";
import authAPI from "../../../helpers/authAPI";

interface EditProps {
  opinion: OpinionDto;
  onClose: () => void;
}

export default function EditOpinionCard({ opinion, onClose }: EditProps) {
  const { id } = useParams();
  const [stars, setStars] = useState<number>(opinion.stars);
  const [content, setContent] = useState<string>(opinion.content);

  function onSubmitClick() {
    authAPI
      .patch(
        `http://localhost:3003/opinions/${opinion.opinionId}`,
        mapToOpinionDto(opinion.opinionId, stars, content, Number(id))
      )
      .then(() => onClose())
      .catch((error) => console.error(error));
  }

  return (
    <Paper
      sx={{
        p: { xs: 3, sm: 4 }, // Padding adjusts for mobile & larger screens
        my: 2, // Margin for spacing
        display: "flex",
        flexDirection: "column",
        gap: 2, // Ensures spacing between elements
        width: "100%",
        maxWidth: "450px", // Limits width for better mobile readability
        mx: "auto", // Centers horizontally
      }}
    >
      {/* ⭐ Rating Input */}
      <Rating
        name="stars-opinion"
        value={stars}
        onChange={(_, val) => setStars(val ? val : 0)}
        sx={{ fontSize: { xs: "1.5rem", sm: "2rem" } }} // Adjusts size on mobile
      />

      {/* 📝 Opinion Input */}
      <FormControl fullWidth>
        <InputLabel htmlFor="component-outlined">Opinion</InputLabel>
        <OutlinedInput
          id="component-outlined"
          label="Opinion"
          value={content}
          multiline
          rows={4}
          onChange={(event: React.ChangeEvent<HTMLInputElement>) =>
            setContent(event.target.value)
          }
          sx={{
            fontSize: { xs: "0.85rem", sm: "1rem" }, // Adjusts text size
          }}
        />
      </FormControl>

      {/* 🚀 Action Buttons */}
      <Button
        variant="contained"
        sx={{
          height: "48px",
          fontSize: { xs: "0.9rem", sm: "1rem" },
          width: "100%",
        }}
        onClick={onSubmitClick}
      >
        Submit
      </Button>

      <Button
        variant="outlined"
        sx={{
          height: "42px",
          fontSize: { xs: "0.85rem", sm: "1rem" },
          width: "100%",
        }}
        onClick={onClose}
      >
        Abort Edit
      </Button>
    </Paper>
  );
}
