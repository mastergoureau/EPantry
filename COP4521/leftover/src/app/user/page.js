// pages/welcome.js
'use client';
import React, { useEffect, useState, useCallback } from 'react';

const UserPage = () => {
  const [foods, setFoods] = useState([]);
  const [pantryItems, setPantryItems] = useState([]);
  const [availableRecipes, setAvailableRecipes] = useState([]);
  const [searchTerm, setSearchTerm] = useState(''); // State to hold the search term

  const fetchPantryItems = useCallback(async () => {
    const response = await fetch('http://localhost:5000/pantry/items', {
      credentials: 'include',
    });
    if (response.ok) {
      const data = await response.json();
      setPantryItems(data);
    } else {
      console.error('Failed to fetch pantry items');
    }
  }, []);
  const fetchAvailableRecipes = useCallback(async () => {
    const response = await fetch('http://localhost:5000/recipes/available', {
      credentials: 'include',
    });
    if (response.ok) {
      const data = await response.json();
      setAvailableRecipes(data);
    } else {
      console.error('Failed to fetch available recipes');
    }
  }, []);

  useEffect(() => {
    const fetchFoods = async () => {
      const response = await fetch('http://localhost:5000/foods', {
        credentials: 'include',
      });
      if (response.ok) {
        const data = await response.json();
        setFoods(data);
      } else {
        console.error('Failed to fetch foods');
      }
    };

    fetchFoods();
    fetchPantryItems();
    fetchAvailableRecipes(); 
  }, [fetchPantryItems, fetchAvailableRecipes]);
  
  function selectRecipe(recipeId) {
    fetch(`http://localhost:5000/select_recipe/${recipeId}`, {
      method: 'POST', // Assuming you're updating to use POST to match session handling
      credentials: 'include', // Important for sessions
    })
    .then(response => {
      if(response.ok) {
        // Navigate to the generic /recipe URL after successful selection
        window.location.href = '/recipe';
      } else {
        alert("Failed to select recipe");
      }
    });
  }

  const addToPantry = async (foodName) => {
    const response = await fetch('http://localhost:5000/pantry/add', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
      body: JSON.stringify({ food_name: foodName }),
    });

    if (response.ok) {
      fetchPantryItems();
      fetchAvailableRecipes();
    } else {
      console.error('Failed to add food to pantry');
    }
  };

  const removeFromPantry = async (foodName) => {
    const response = await fetch('http://localhost:5000/pantry/remove', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
      body: JSON.stringify({ food_name: foodName }),
    });

    if (response.ok) {
      fetchPantryItems();
      fetchAvailableRecipes();
    } else {
      console.error('Failed to remove food from pantry');
    }
  };
  const handleSearchChange = (e) => {
    setSearchTerm(e.target.value);
  };

  // Filter foods based on the search term
  const filteredFoods = foods.filter(food =>
    food.food_name.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div style={{ display: 'flex', height: '100vh' }}>
      <div style={{
        flexBasis: '20%',
        overflow: 'hidden',
        margin: '0 20px',
        height: 'calc(100vh - 0px)',
        paddingTop: '0px',
        paddingBottom: '180px',
      }}>
        <div style={{
          height: 'calc(100% + 100px)',
          marginTop: '80px',
          marginBottom: '10px',
          overflowY: 'auto',
        }}>
          <h2>Available Foods</h2>
          <input
            type="text"
            placeholder="Search foods..."
            value={searchTerm}
            onChange={handleSearchChange}
            style={{ width: '85%', padding: '10px', marginBottom: '20px',  border: '2px solid black' }}
          />
          <ul style={{ listStyleType: 'none', padding: 0 }}>
            {filteredFoods.map((food, index) => (
              <li key={index} style={{ padding: '0.5rem 0' }}>
                {food.food_name}
                <button onClick={() => addToPantry(food.food_name)} style={{
                    padding: '5px 10px',
                    fontSize: '12px',
                    margin: '0 10px',
                    border: 'none',
                    borderRadius: '4px',
                    cursor: 'pointer',
                    backgroundColor: '#4CAF50',
                    color: 'white',
                    transition: 'background-color 0.3s',
                  }} 
                  onMouseOver={(e) => e.target.style.backgroundColor = '#45a049'}
                  onMouseOut={(e) => e.target.style.backgroundColor = '#4CAF50'}>
                  Add to Pantry
                </button>
              </li>
            ))}
          </ul>
        </div>
      </div>
      <div style={{ flexBasis: '20%',
        overflow: 'hidden',
        height: 'calc(100vh - 0px)',
        paddingTop: '80px',
        paddingBottom: '120px',
        marginLeft: '20px' }}>
        <h2>My Pantry</h2>
        <ul style={{ listStyleType: 'none', padding: 0 }}>
          {pantryItems.map((item, index) => (
            <li key={index} style={{ padding: '0.5rem 0' }}>
              {item.food_name}
              <button onClick={() => removeFromPantry(item.food_name)} style={{
                    padding: '5px 10px',
                    fontSize: '12px',
                    margin: '0 10px',
                    border: 'none',
                    borderRadius: '4px',
                    cursor: 'pointer',
                    backgroundColor: '#f44336',
                    color: 'white',
                    transition: 'background-color 0.3s',
                  }} onMouseOver={(e) => e.target.style.backgroundColor = '#d32f2f'}
                  onMouseOut={(e) => e.target.style.backgroundColor = '#f44336'}>
                  Remove from Pantry
                </button>
            </li>
          ))}
        </ul>
      </div>
      <div style={{ flexBasis: '20%',
        overflow: 'hidden',
        margin: '0 20px',
        height: 'calc(100vh - 0px)',
        paddingTop: '80px',
        paddingBottom: '180px', }}>
      <h2>Available Recipes</h2>
      <ul style={{ listStyleType: 'none', padding: 0 }}>
      {availableRecipes.map((recipe, index) => (
        <li key={index} style={{ padding: '0.5rem 0', cursor: 'pointer', color: 'blue' }}
            onClick={() => selectRecipe(recipe.recipe_id)}>
          {recipe.recipe_name}
          </li>
        ))}
  </ul>
</div>
    </div>
  );
};

export default UserPage;
