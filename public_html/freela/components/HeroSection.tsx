import Image from 'next/image';
import Link from 'next/link';

const Hero = () => {
  return (
    <div className="relative h-screen">
      {/* Background Image */}
      <div className="absolute inset-0">
      <Image
        src="/images/hero-bg.jpg"
        alt="Hero Background Image"
        fill
        className="object-center object-top"
        />
      </div>

      {/* Overlay */}
      <div className="absolute inset-0 bg-black opacity-60"></div>

      {/* Content */}
      <div className="relative z-10 flex flex-col justify-center items-center h-full">
        <h1 className="text-5xl sm:text-6xl lg:text-7xl xl:text-8xl text-white font-bold text-center mb-8">
          Record Work Time Like A Pro
        </h1>
        <h2 className="text-2xl sm:text-3xl lg:text-4xl xl:text-5xl text-white font-medium text-center mb-12">
          An easy-to-use time tracking tool for professionals
        </h2>
        <div className="text-center">
          <Link href="/signup" legacyBehavior>
            <a className="bg-white text-black px-8 py-4 font-medium rounded-full hover:bg-gray-200 transition duration-300 ease-in-out">
              Get started
            </a>
          </Link>
        </div>
      </div>
    </div>
  );
};

export default Hero;