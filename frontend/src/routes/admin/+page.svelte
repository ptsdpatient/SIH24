<script>
    import {onMount} from 'svelte'

    const apiKey = import.meta.env.VITE_API_KEY;


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
              if(!data.admin){
                window.location.href='/home'
              }
            }

        }catch(err){
            alert("your session has expired, please login again")
        }
    }



    onMount(()=>{
        const token = localStorage.getItem('token');
         if(token) {
            authenticateToken(token)
         }
    })
</script>