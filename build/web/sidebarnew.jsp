<script>
    
    var messageToEmail;
    var a;
    var m=0;
    function fetchOnlineFriends()
    {
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function()
        {
            if(xml.readyState==4 && xml.status==200)
            {
                document.getElementById("sidebarnew").innerHTML = xml.responseText;
            }
        };
        xml.open("GET","fetch_online_friends.jsp",true);
        xml.send();
    }
    
    function start()
    {
        setInterval(fetchOnlineFriends,5000);
    }
    
    function startChat(profilepic,firstName,lastName,friendEmail)
    {
        clearInterval(a);
        messageToEmail = friendEmail;
        //alert(firstName+" "+lastName+" "+friendEmail+" "+profilepic);
        document.getElementById("chatdiv").style.display = "block";
        document.getElementById("chatimage").src=profilepic;
        document.getElementById("chatname").innerHTML = firstName+" "+lastName;
        
        a = setInterval(fetchOldChat,1000);
    }
    
    function sendMessage()
    {
        var msg = document.getElementById("msg").value;
        var xml = new XMLHttpRequest();
        
        xml.onreadystatechange = function()
        {
            if(xml.readyState==4 && xml.status==200)
            {
                document.getElementById("msg").value="";
                document.getElementById("allmessagediv").innerHTML = xml.responseText;
                document.getElementById("allmessagediv").scrollTop = document.getElementById("allmessagediv").scrollHeight;
            }
        };
        xml.open("GET","send_chat_message.jsp?msg="+msg+"&message_to_email="+messageToEmail,true);
        xml.send();
    }
    
    function fetchOldChat()
    {
       var xml = new XMLHttpRequest();
        
        xml.onreadystatechange = function()
        {
            if(xml.readyState==4 && xml.status==200)
            {
                
                if(m==0)
                {
                    document.getElementById("allmessagediv").innerHTML = xml.responseText;
                    document.getElementById("allmessagediv").scrollTop = document.getElementById("allmessagediv").scrollHeight;
                    m=1;
                }
                else
                {
                    
                    if(document.getElementById("allmessagediv").scrollHeight-document.getElementById("allmessagediv").scrollTop<400)
                    {
                        
                        document.getElementById("allmessagediv").innerHTML = xml.responseText;
                        document.getElementById("allmessagediv").scrollTop = document.getElementById("allmessagediv").scrollHeight;
                    }
                    else
                    {
                        document.getElementById("allmessagediv").innerHTML = xml.responseText;
                    }
                }
            }
        };
        xml.open("GET","fetch_old_chat_message.jsp?message_to_email="+messageToEmail,true);
        xml.send();
       
    }
    
    
</script>
<div id="sidebarnew">
    
</div>