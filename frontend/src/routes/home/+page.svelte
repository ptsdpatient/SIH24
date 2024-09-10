<script>
    import {onMount} from 'svelte'

    let apiKey='https://c112-2401-4900-1c9a-8d23-4d54-16fd-38dc-e663.ngrok-free.app/'


    async function authenticateToken(token){
        try{
            const response = await fetch((apiKey+'authenticateToken'), {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}`
                }
            })
            const data = await response.json();
            if(data.auth){
                    alert("you are authenticated")
                }else {
                    alert("your session has expired, please login again")
                    window.location.href = '/login'
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