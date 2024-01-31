import Image from 'next/image'
import Link from 'next/link'

export default function Login() {
    return (
      <div className="flex h-screen">
        <div className="w-full flex items-center justify-center">
          <form className="w-1/2 bg-primary flex flex-col rounded-lg shadow-2xl space-y-2 text-left p-6">
            <h1 className="text-3xl font-signature mb-6 text-muted">Login to your Account</h1>
            <label className="font-bold text-lg text-muted">Username</label>
            <input
              className="border border-accent rounded-lg px-2 py-2"
              type="text"
              placeholder="Username"
            />
            <label className="font-bold text-lg text-muted">Password</label>
            <input
              className="border border-accent rounded-lg px-2 py-2"
              type="password"
              placeholder="Password"
            />
            <div className='p-4'/>
            <button className="bg-secondary hover:bg-muted text-white hover:text-secondary rounded-lg py-2">
              Create Account
            </button>
            <h4 className="pt-4 text-muted text-center"> If you need an account <Link href="/register" className="hover:text-secondary">click here to register</Link></h4>
          </form>
        </div>
        <Image src="/login.jpg" width={500} height={400} className="w-1/2 h-full lg:block hidden"/>
      </div>
    );
  }