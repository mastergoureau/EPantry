import Image from "next/image";
import Link from "next/link";

export default function Register() {
    return (
      <div className="flex h-screen">
        <div className="w-full flex items-center justify-center">
          <form className="w-full max-w-md mx-auto bg-primary flex flex-col rounded-lg shadow-2xl space-y-1 text-left p-4 mt-20">
            <h1 className="text-3xl font-signature mb-6 text-muted">Create your Account</h1>
            <div className="flex row space-x-2">
              <div className="flex-1">
                <label className="font-bold text-lg text-muted">First Name</label>
                <input
                  className="border border-accent rounded-lg px-1 py-1"
                  type="text"
                  placeholder="First Name"
                />
              </div>
              <div className="flex-1">
                <label className="font-bold text-lg text-muted">Last Name</label>
                <input
                  className="border border-accent rounded-lg px-1 py-1"
                  type="text"
                  placeholder="Last Name"
                />
              </div>
            </div>
            <label className="font-bold text-lg text-muted">Email</label>
            <input
              className="border border-accent rounded-lg px-2 py-1"
              type="text"
              placeholder="Email"
            />
            <label className="font-bold text-lg text-muted">Username</label>
            <input
              className="border border-accent rounded-lg px-2 py-1"
              type="text"
              placeholder="Username"
            />
            <label className="font-bold text-lg text-muted">Password</label>
            <input
              className="border border-accent rounded-lg px-2 py-1"
              type="password"
              placeholder="Password"
            />
            <label className="font-bold text-lg text-muted">Confirm Password</label>
            <input
              className="border border-accent rounded-lg px-2 py-1 mb-4"
              type="password"
              placeholder="Confirm Password"
            />
            <div className='p-4'/>
            <button className="bg-secondary hover:bg-muted text-white hover:text-secondary rounded-lg py-2">
              Create Account
            </button>
            <h4 className="pt-4 text-muted text-center"> If you already have an account <Link href="/login" className="hover:text-secondary">click here to login</Link></h4>
          </form>
        </div>
        <Image src="/registration.jpg" width={500} height={400} className="w-1/2 h-full lg:block hidden"/>
      </div>
    );
  }