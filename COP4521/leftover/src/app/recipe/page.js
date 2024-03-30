'use client';
import React, { useEffect, useState } from 'react';

const RecipePage = () => {
  const [recipeDetails, setRecipeDetails] = useState(null);

  useEffect(() => {
    const fetchRecipeDetails = async () => {
      // Directly fetch from /recipe, which now uses the session-stored recipe ID
      const response = await fetch(`http://localhost:5000/recipe`, {
        credentials: 'include',
      });
      if (response.ok) {
        const data = await response.json();
        setRecipeDetails(data);
      } else {
        console.error('Failed to fetch recipe details');
      }
    };

    fetchRecipeDetails();
}, []); // Empty dependency array means this effect runs once on mount

  if (!recipeDetails) {
    return <p>Loading...</p>;
  }

  return (
    <div>
      <h2>{recipeDetails.recipe_name}</h2>
      <ul>
        {recipeDetails.ingredients.map((ingredient, index) => (
          <li key={index}>{`${ingredient.food_name}: ${ingredient.quantity} ${ingredient.measurement}`}</li>
        ))}
      </ul>
    </div>
  );
};

export default RecipePage;