'use client'

import Image from "next/image";
import Link from "next/link";
import React, { useState, useEffect} from "react";
import { FaBars, FaTimes } from "react-icons/fa";

const Header = () => {
 const [nav, setNav] = useState(false);

 const links = [
    {
      id: 1,
      link: "register",
    },
    // Add more links as needed...
 ];

    const handleResize = () => {
        if (window.innerWidth >= 768) { // Assuming 768px is your md breakpoint
            setNav(false);
        }
    };

    // Set up event listener for window resize
    useEffect(() => {
        window.addEventListener('resize', handleResize);

        // Clean up the event listener
        return () => {
            window.removeEventListener('resize', handleResize);
        };
    }, []);
 return (
    <div className="flex justify-between items-center bg-primary text-muted w-full h-20 px-4 nav">
      <div>
        <h1 className="text-5xl font-signature ml-2">
          <a
            className="link-underline link-underline-black"
            href="/"
          >
            <Image src="/logo.png" alt="Logo" width={250} height={0}/>
          </a>
        </h1>
      </div>

      <ul className="hidden md:flex">
        {links.map(({ id, link }) => (
          <li
            key={id}
            className="nav-links px-4 cursor-pointer capitalize font-medium text-gray-500 hover:scale-105 hover:text-white duration-200 link-underline"
          >
            <Link href={link}>{link}</Link>
          </li>
        ))}
      </ul>

      <div
        onClick={() => setNav(!nav)}
        className="cursor-pointer pr-4 z-10 text-gray-500 md:hidden"
      >
        {nav ? <FaTimes size={30} /> : <FaBars size={30} />}
      </div>

      {nav && (
        <ul className="flex flex-col justify-center items-center absolute top-0 left-0 w-full h-screen bg-primary text-gray-500">
          {links.map(({ id, link }) => (
                <>
                <li
                key={id}
                className="px-4 cursor-pointer capitalize py-6 text-4xl"
                >
                <Link onClick={() => setNav(!nav)} href={link}>
                    {link}
                </Link>
                </li>
                <br />
            </>
          ))}
        </ul>
      )}
    </div>
 );
};

export default Header;
