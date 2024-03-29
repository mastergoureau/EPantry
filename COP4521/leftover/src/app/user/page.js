// pages/welcome.js
'use client';
import React, { useEffect, useState } from 'react';

const UserPage = () => {
  const [userInfo, setUserInfo] = useState(null);

  useEffect(() => {
    const fetchUserInfo = async () => {
      const response = await fetch(`http://localhost:5000/user`, {
        credentials: 'include',  // Ensures cookies, including session cookies, are sent with the request
      });
      if (response.ok) {
        const data = await response.json();
        setUserInfo(data);
      }
    };
  
    fetchUserInfo();
  }, []);

  return (
    <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh', flexDirection: 'column' }}>
      {userInfo ? (
        <div style={{ textAlign: 'center' }}>
          <h1>Welcome, {userInfo.firstName} {userInfo.lastName}</h1>
          <p>Email: {userInfo.email}</p>
        </div>
      ) : <p>Loading...</p>}
    </div>
  );
};

export default UserPage;