<script>
$(document).ready(function(){
    $('input[type=submit]').click(function(){
        passworduppercharacters = 0;
        passwordlowercharacters = 0;
        passwordnumericcharacters = 0;
        passwordsymbolcharacters = 0;
        val = $('input[name=passwd]').val();
        for(i=0;i<val.length;i++)
        {
            if(val.charCodeAt(i)>=65&&val.charCodeAt(i)<=90)
            {
                passworduppercharacters++;
            }
            else if(val.charCodeAt(i)>=97&&val.charCodeAt(i)<=122)
            {
                passwordlowercharacters++;
            }
            else if(val.charCodeAt(i)>=48&&val.charCodeAt(i)<=57)
            {
                passwordnumericcharacters++;
            }
            else
            {
                passwordsymbolcharacters++;
            }
        }
        if($('input[name=passwd]').val().length==0)
        {
            alert("Email and Password Required");
            return false;
        }
        if($('input[name=passwd]').val().length<10||$('input[name=passwd]').val().length>20||passworduppercharacters==0||passwordlowercharacters==0||passwordnumericcharacters==0||passwordsymbolcharacters==0)
        {
            alert("Password Should Contain Atleast 1 Upppercase Character Atleast 1 Lowercase Character Atleast 1 Number Atleast 1 Special Symbol and length should be atleast 10 and not exceeding 20.");
            return false;
        }
    });
});
</script>