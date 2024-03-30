// pages/welcome.js
'use client';
import React, { useEffect, useState, useCallback } from 'react';

const UserPage = () => {
  const [foods, setFoods] = useState([]);
  const [pantryItems, setPantryItems] = useState([]);
  const [availableRecipes, setAvailableRecipes] = useState([]);

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

  const addToPantry = async (foodName) => {
    const response = await fetch('http://localhost:5000/pantry/add', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
      body: JSON.stringify({ food_name: foodName }),
    });

    if (response.ok) {
      fetchPantryItems();
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
    } else {
      console.error('Failed to remove food from pantry');
    }
  };

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
          <ul style={{ listStyleType: 'none', padding: 0 }}>
            {foods.map((food, index) => (
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
                  }} onMouseOver={(e) => e.target.style.backgroundColor = '#45a049'}
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
          <li key={index} style={{ padding: '0.5rem 0' }}>
            {recipe.recipe_name}
          </li>
        ))}
  </ul>
</div>
    </div>
  );
};

export default UserPage;
