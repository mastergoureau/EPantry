'use client';
import React, { useEffect, useState } from 'react';

const flask = () => {
  const [data, setData] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('http://127.0.0.1:5000/api/data');
        const jsonData = await response.json();
        setData(jsonData);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };

    fetchData();
  }, []);

  return (
    <div>
        <h1 className='mt-20'>Flask</h1>
        <p>API response: {data ? data.message : 'Loading...'}</p>
    </div>
  );
};

export default flask;