import { FaUserMd, FaHammer } from 'react-icons/fa';

const testimonials = [
  {
    text: "This app has completely transformed the way I manage my work as a doctor. It's so intuitive and user-friendly!",
    name: "Dr. Jane Smith",
    profession: "Doctor",
    icon: <FaUserMd size={40} />
  },
  {
    text: "I highly recommend this app for anyone in the construction industry. It has all the features we need to stay organized and on top of things!",
    name: "John Doe",
    profession: "Builder",
    icon: <FaHammer size={40} />
  }
];

function Testimonials() {
  return (
    <section className="bg-white">
      <div className="max-w-7xl mx-auto py-16 px-4 sm:px-6 lg:px-8">
        <div className="max-w-3xl mx-auto">
          <h2 className="text-3xl font-extrabold tracking-tight text-gray-900 sm:text-4xl">What our customers are saying</h2>
          <div className="mt-12 space-y-8">
            {testimonials.map((testimonial, index) => (
              <div key={index} className="relative">
                <div className="relative text-lg md:flex-grow">
                  <div className="absolute inset-0 flex items-center" aria-hidden="true">
                    <div className="w-full border-t border-gray-300" />
                  </div>
                  <div className="relative flex">
                    <div className="flex-shrink-0">{testimonial.icon}</div>
                    <blockquote className="relative">
                      <div className="text-2xl font-medium text-gray-900">{testimonial.text}</div>
                      <footer className="mt-4">
                        <div className="text-lg font-medium text-gray-900">{testimonial.name}</div>
                        <div className="text-gray-500">{testimonial.profession}</div>
                      </footer>
                    </blockquote>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}

export default Testimonials;