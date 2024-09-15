<script>
    import {onMount} from 'svelte'
    const apiKey = import.meta.env.VITE_API_KEY;

    let email = '';
    let password = '';
    let enableTokenDebugging = false;


    async function authenticateToken(token){
        try{
            const response = await fetch((apiKey+'authenticateToken'), {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}`
                },
               
            })

            const data = await response.json();

            if(data.auth){
              window.location.href = data.admin?'/admin':'/home'
            }

        }catch(err){
            alert("your session has expired, please login again")
        }
    }
  
    async function handleLogin() {
      const loginData = {
        email: email,
        password: password
      };
  
      try {
        const response = await fetch((apiKey+'login'), {
          method: 'POST',
          headers: {
          'Content-Type': 'application/json'
          },
          body: JSON.stringify(loginData),
        });
  
        if (!response.ok) {
          alert("failed")
          throw new Error('Login failed');
        }
    

        const data = await response.json();
        
        if(data.token) {
          localStorage.setItem('token', data.token);
        }

        if(data.user.isAdmin>0)admin=true
        
        window.location.href = '/home'
  
        console.log('Login successful:', data);
      } catch (error) {
        console.error('Error during login:', error);
      }
    }


    onMount(()=>{
         const token = localStorage.getItem('token');
         if(token) {
            authenticateToken(token)
         }
    })

  </script>


<div class="flex flex-col md:flex-row justify-end bg-gradient-to-r from-green-600 to-blue-500" style="width:100vw;height:100svh">

    <div class=" absolute md:relative flex items-center justify-center p-4">
        <div class="bg-white bg-opacity-30 backdrop-blur rounded-lg shadow-lg p-6 max-w-md w-full animate-fadeIn">
            <p id="login" class="text-center text-xl font-semibold">Log in to Alumni Connect</p>
            <div action="" class="mt-4">
                <input bind:value={email} type="email" id="username" name="username" placeholder="email id"  required class="w-full p-2.5 mb-4 border-none rounded-lg text-lg bg-gray-100 outline-none">
                <input bind:value={password} type="password" id="password" name="password" placeholder="Password" required class="w-full p-2.5 mb-4 border-none rounded-lg text-lg bg-gray-100 outline-none">
                <p class="text-gray-600 text-center mb-4">
                    <a href="forgot_password.html" class="text-blue-600">Forgot Password?</a>
                </p>
                

                <button on:click={()=>handleLogin()} class="w-full p-2.5 mb-4 border-none rounded-lg text-lg bg-orange-600 text-white cursor-pointer">Login</button>
      

                <p id="suggest" class="text-gray-600 text-center text-lg mb-4">Or login with</p>
                
                <div class="w-2/3 mx-auto flex flex-wrap justify-between">
                  
                  <button class="w-1/2 flex flex-row justify-around p-2.5 mb-4 border-none rounded-lg text-lg bg-gray-200 flex items-center justify-center">
                    <img class="w-1/4 " src="/icon/google.png" alt=""> Google
                  </button>
                
                </div>

                <p id="suggest" class="text-gray-600 text-center text-lg">Don't have an account? 
                    <a href="login.svelte" id="signup" class="text-red-600">Sign up now</a>
                </p>
              </div>
        </div>
    </div>
    



</div>