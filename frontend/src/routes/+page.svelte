<div class="flex flex-col md:flex-row justify-between " style="width:100vw">
    <img id="imag" src="/images.jpg" alt="alum_img" class=" h-screen object-cover">

    <div class=" absolute md:relative flex items-center justify-center p-4">
        <div class="bg-white bg-opacity-70 backdrop-blur rounded-lg shadow-lg p-6 max-w-md w-full animate-fadeIn">
            <p id="login" class="text-center text-xl font-semibold">Log in to Alumni Connect</p>
            <form action="" class="mt-4">
                <input type="text" id="username" name="username" placeholder="Student Id"  required class="w-full p-2.5 mb-4 border-none rounded-lg text-lg bg-gray-100 outline-none">
                <input type="password" id="password" name="password" placeholder="Password" required class="w-full p-2.5 mb-4 border-none rounded-lg text-lg bg-gray-100 outline-none">
                <p class="text-gray-600 text-center mb-4">
                    <a href="forgot_password.html" class="text-blue-600">Forgot Password?</a>
                </p>
                
                <a href="home">
                    <input id="submit" type="submit" value="Login" class="w-full p-2.5 mb-4 border-none rounded-lg text-lg bg-red-600 text-white cursor-pointer">
                </a>

                <p id="suggest" class="text-gray-600 text-center text-lg mb-4">Or login with</p>
                <button class="w-full p-2.5 mb-4 border-none rounded-lg text-lg bg-gray-200 flex items-center justify-center">
                    <i class="fa-brands fa-google mr-2"></i> Google
                </button>
                <button class="w-full p-2.5 mb-4 border-none rounded-lg text-lg bg-gray-200 flex items-center justify-center">
                    <i class="fa-brands fa-github mr-2"></i> Github
                </button>
                <button class="w-full p-2.5 mb-4 border-none rounded-lg text-lg bg-gray-200 flex items-center justify-center">
                    <i class="fa-brands fa-linkedin mr-2"></i> LinkedIn
                </button>
                <p id="suggest" class="text-gray-600 text-center text-lg">Don't have an account? 
                    <a href="login.svelte" id="signup" class="text-red-600">Sign up now</a>
                </p>
            </form>
        </div>
    </div>
    

    


</div>