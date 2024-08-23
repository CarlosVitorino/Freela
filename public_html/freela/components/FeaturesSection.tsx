import Image from 'next/image';

const Features = () => {
  return (
    <section className="bg-white py-16">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center">
          <h2 className="text-3xl font-extrabold tracking-tight text-gray-900 sm:text-4xl">
            Key Features
          </h2>
          <p className="mt-4 max-w-2xl text-xl text-gray-500 mx-auto">
            Here are some of the ways our app can help you manage your work more effectively.
          </p>
        </div>
        <div className="mt-20">
          <div className="flex flex-wrap -mx-4">
            <div className="md:w-1/3 px-4 mb-8 md:mb-0">
              <div className="flex">
                <div className="w-16 h-16 rounded-md bg-indigo-50 flex items-center justify-center">
                  <Image src="/images/feature-1.svg" width={64} height={64} alt="Feature 1" />
                </div>
                <div className="ml-4">
                  <h3 className="text-lg font-medium text-gray-900">Client Management</h3>
                  <p className="mt-2 text-base text-gray-500">
                    Keep track of all your clients in one place, with detailed profiles and contact information.
                  </p>
                </div>
              </div>
            </div>
            <div className="md:w-1/3 px-4 mb-8 md:mb-0">
              <div className="flex">
                <div className="w-16 h-16 rounded-md bg-indigo-50 flex items-center justify-center">
                  <Image src="/images/feature-2.svg" width={64} height={64} alt="Feature 2" />
                </div>
                <div className="ml-4">
                  <h3 className="text-lg font-medium text-gray-900">Class Scheduling</h3>
                  <p className="mt-2 text-base text-gray-500">
                    Easily schedule and manage your classes, with intuitive tools for setting up recurring sessions.
                  </p>
                </div>
              </div>
            </div>
            <div className="md:w-1/3 px-4 mb-8 md:mb-0">
              <div className="flex">
                <div className="w-16 h-16 rounded-md bg-indigo-50 flex items-center justify-center">
                  <Image src="/images/feature-3.svg" width={64} height={64} alt="Feature 3" />
                </div>
                <div className="ml-4">
                  <h3 className="text-lg font-medium text-gray-900">Billing and Invoicing</h3>
                  <p className="mt-2 text-base text-gray-500">
                    Create invoices and track payments with ease, and get paid faster with online payment options.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Features;