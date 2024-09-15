<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gradsy Login</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

  <!-- Container -->
  <div class="bg-white p-8 py-2 rounded-lg shadow-lg max-w-md w-full">
    <!-- Logo -->
    <div class="flex justify-center mb-2">
      <img src="/icon/gradsy.png" alt="Gradsy Logo" class="h-16">
    </div>

    <!-- Email and Password Form -->
    <form action="#" method="POST">
      <!-- Email -->
      <div class="mb-4">
        <label for="email" class="block text-gray-700">Email</label>
        <input type="email" id="email" name="email" placeholder="Enter Your Email" class="w-full p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
      </div>

      <!-- Password -->
      <div class="mb-4 relative">
        <label for="password" class="block text-gray-700">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter Your Password" class="w-full p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
        <span class="absolute inset-y-0 right-0 pr-3 flex items-center cursor-pointer">
          <svg class="h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12h.01M12 12h.01M9 12h.01M4 12h16M4 6h16M4 18h16"/>
          </svg>
        </span>
      </div>

      <!-- Forgot Password -->
      <div class="flex justify-between items-center mb-4">
        <a href="#" class="text-sm text-gray-600 hover:text-blue-500">Forgot Password?</a>
      </div>

      <!-- Sign In Button -->
      <button type="submit" class="w-full bg-blue-500 text-white p-2 rounded-lg hover:bg-blue-600">SIGN IN</button>
    </form>

    <!-- Sign Up Link -->
    <p class="text-center text-gray-600 mt-4">Don't have an account? <a href="#" class="text-blue-500 hover:underline">Sign Up</a></p>

    <!-- OR Sign In With -->
    <div class="flex items-center justify-center mt-">
      <div class="border-t w-full"></div>
      <span class="mx-3 text-gray-500">Or Sign In With</span>
      <div class="border-t w-full"></div>
    </div>

    <!-- Social Buttons -->
    <div class="flex justify-center mt-4 space-x-4">
      <a href="#" class="bg-white border p-2 rounded-lg hover:bg-gray-100 flex items-center">
        <img src="/icon/google.png" alt="Google" class="h-6 w-6">
      </a>
      <a href="#" class="bg-white border p-2 rounded-lg hover:bg-gray-100 flex items-center">
        <img src="/icon/github.png" alt="GitHub" class="h-6 w-6">
      </a>
      <a href="#" class="bg-white border p-2 rounded-lg hover:bg-gray-100 flex items-center">
        <img src="/icon/linkdin.png" alt="LinkedIn" class="h-6 w-6">
      </a>
    </div>
  </div>

</body>
</html>
