import { useEffect, useState } from "react";
import { Tabs, Tab, Box } from "@mui/material";
import authAPI from "../../helpers/authAPI";
import { useNavigate } from "react-router-dom";

const Categories = () => {
  const [activeTab, setActiveTab] = useState<string | null>(null); // No tab active initially
  const [categories, setCategories] = useState<{ name: string }[]>([]);
  const navigate = useNavigate();

  useEffect(() => {
    authAPI.get("http://localhost:3001/categories/").then((res) => {
      if (res && res.data.result) {
        setCategories(res.data.result);

        // Auto-select the first category if none is selected
        if (!activeTab && res.data.result.length > 0) {
          setActiveTab(res.data.result[0].name.toLowerCase());
        }
      }
    });
  }, []);

  const handleTabChange = (_: any, newValue: string) => {
    setActiveTab(newValue.toLowerCase());
    navigate(`/categories/${newValue.toLowerCase()}`, { replace: true });
  };

  return (
    <Box sx={{ width: "100%", borderColor: "divider", display: "flex", justifyContent: "center" }}>
      <Tabs
        value={activeTab ?? false}
        onChange={handleTabChange}
        indicatorColor="primary"
        textColor="primary"
        variant="scrollable"
        scrollButtons="auto"
        allowScrollButtonsMobile 
        sx={{
          justifyContent: "center", 
          maxWidth: "100%",
        }}
        
      >
        {categories.map((cat) => (
          <Tab
          label={cat.name.toUpperCase()}
          value={cat.name.toLowerCase()}
          key={cat.name}
          sx={{
            fontSize: {
              xs: "0.75rem", 
              sm: "0.875rem", 
              md: "1rem", 
            },

          }}
        />
        ))}
      </Tabs>
    </Box>
  );
};

export default Categories;
