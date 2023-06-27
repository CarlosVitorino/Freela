import { Inter } from 'next/font/google'
import HeroSection from '../components/HeroSection';
import FeaturesSection from '../components/FeaturesSection'
import TestimonialsSection from '../components/TestimonialsSection'

const inter = Inter({ subsets: ['latin'] })

export default function Home() {
  return (
    <>
        <HeroSection />
        <FeaturesSection />
        <TestimonialsSection />
    </>
  )
}
