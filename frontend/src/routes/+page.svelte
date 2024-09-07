<script>
    // Define variables to hold user input
    let apiKey='https://111b-2401-4900-1c9b-7f5e-1842-e1bd-9b1-9ec1.ngrok-free.app/'
    let email = '';
    let password = '';
    let login=false
    let messages=[]
  
    // Function to handle form submission
    async function handleLogin() {
      event.preventDefault(); // Prevent default form submission behavior
  
      // Login request payload
      const loginData = {
        email: email,
        password: password
      };
  
      try {
        // Send POST request to the login endpoint
        const response = await fetch(apiKey+'login', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(loginData)
        });
  
        // Check if the response is ok (status in the range 200-299)
        if (!response.ok) {
          throw new Error('Login failed');
        }
  
        // Parse the response as JSON
        const data = await response.json();
        if(response.status==200) {
            login=true
            getMessageChannels()
        }
  
        // Handle successful login, e.g., save token, redirect, etc.
        console.log('Login successful:', data);
      } catch (error) {
        // Handle errors
        console.error('Error during login:', error);
      }
    }


    async function getMessageChannels() {
        try {
        const loginData = {
            email: email,
            password: password
        };
        // Send POST request to the login endpoint
        const response = await fetch(apiKey+'messageChannel', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(loginData)
        });
  
        // Check if the response is ok (status in the range 200-299)
        if (!response.ok) {
          throw new Error('Login failed');
        }
  
        // Parse the response as JSON
        messages = await response.json();
  
        // Handle successful login, e.g., save token, redirect, etc.
        console.log('Login successful:', data);
      } catch (error) {
        // Handle errors
        console.error('Error during login:', error);
      }
    }


  </script>


<div class="flex flex-col md:flex-row justify-end bg-gradient-to-r from-red-600 to-blue-400" style="width:100vw;height:100svh">

    {#if !login}
    <div class=" absolute md:relative flex items-center justify-center p-4">
        <div class="bg-white bg-opacity-30 backdrop-blur rounded-lg shadow-lg p-6 max-w-md w-full animate-fadeIn">
            <p id="login" class="text-center text-xl font-semibold">Log in to Alumni Connect</p>
            <form action="" class="mt-4">
                <input bind:value={email} type="text" id="username" name="username" placeholder="email id"  required class="w-full p-2.5 mb-4 border-none rounded-lg text-lg bg-gray-100 outline-none">
                <input bind:value={password} type="password" id="password" name="password" placeholder="Password" required class="w-full p-2.5 mb-4 border-none rounded-lg text-lg bg-gray-100 outline-none">
                <p class="text-gray-600 text-center mb-4">
                    <a href="forgot_password.html" class="text-blue-600">Forgot Password?</a>
                </p>
                

                <button on:click={handleLogin} id="submit" type="submit" value="Login" class="w-full p-2.5 mb-4 border-none rounded-lg text-lg bg-red-600 text-white cursor-pointer">Login</button>
      

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
    
{:else}
    <div class="flex flex-col w-full">
        <p>Messaging Channels</p>
        {#each messages as message}
            <div>
                {message.channelID}
            </div>
        {/each}
    </div>
{/if}
    


</div>