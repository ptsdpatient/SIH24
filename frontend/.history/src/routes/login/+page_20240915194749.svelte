<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
</head>
<body class="flex items-center justify-center h-screen bg-gray-200 p-2">
    <div class="min-w-96 max-w-102 bg-[#fffefe] h-auto px-auto rounded-lg p-8 md:w-102">
        <div class="flex flex-col">
            <div class="flex items-center "><img class="mx-auto" src="About.png" alt="" class=""></div>
             
            
           <div class="">
            <form action="">
                <div class="flex flex-col my-3">
                <label for="text">Email</label>
                <input type="text" class="w-full p-2 border  rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400" placeholder="Enter your Email"></div>
                
                <div class="flex flex-col my-3">
                <label for="text">Password</label>
                <input type="text" class="w-full p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400" placeholder="Enter your Password"></di>
                <div class="flex flex-col-reverse opacity-80 text-right" ><p>Forgot Password?</p></div>
    
                <button class="px-2 py-1 my-6 bg-[#49b6c5] rounded-xl w-36 text-white mx-auto hover:bg-[#43a2ae]"><p class="font-semibold">LOG IN</p></button>
              </form>
           </div>
           <div class="flex items-center">
            <p class="  mx-auto">Don't have an account? <a href="signup.html" class="text-[#49b6c5] hover:text-[#43a2ae] hover:underline">Sign Up</a></p>
           </div>
           
           <!-- <div class="flex items-center justify-between mb-4">
            <div class="border-t w-1/3"></div>
            <div class="mx-3 text-sm text-gray-500 w-2/3">Or Sign In With</div  >
            <div class="border-t w-1/3"></div>
             </div> -->
             <div class="flex items-center justify-between my-4">
                <div class="border-t w-1/3"></div>
                <div class="flex-grow text-center text-sm text-gray-500">Or Sign In With</div>
                <div class="border-t w-1/3"></div>
              </div>
        

           <div class="flex flex-row items-center"> 
            <button class="border flex items-center border-black  border-opacity-30  mx-auto px-2 rounded-md  hover:bg-[#edeaea] "><img class="size-4 mr-1" src="google.png" alt="">Google</button>
            <button class="border flex items-center border-black  border-opacity-30  mx-auto px-2 rounded-md  hover:bg-[#f0eded] "><img class="size-4 mr-1" src="github.png" alt="">Github</button>
            <button class="border flex items-center border-black  border-opacity-30  mx-auto px-2 rounded-md hover:bg-[#edeaea] "><img class="size-4 mr-1" src="linkedin.png" alt="">LinkedIn</button>
           </div>

    </div>
</body>
</html>