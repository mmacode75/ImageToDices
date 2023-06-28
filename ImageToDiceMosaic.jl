using Images #pkg add Images on juliaconsole
using FileIO #pkg add FileIO on juliaconsole
using TestImages #pkg add TestImages on juliaconsole
using Statistics
using DelimitedFiles #pkg add DelimitedFiles on juliaconsole

dices = ['⚀','⚁','⚂','⚃','⚄','⚅'];
Image= FileIO.load("chifuyu.jpg"); #path to image
imageAux=channelview(Image);
result=Int16.(round.(mean(imageAux,dims=1)*6,RoundNearestTiesUp))[1,:,:];
reversed=reverse(dices); #black over white
#reversed=dices #white over black
function interchange(data)
    if(data==0)
        return reversed[1];
    end
    return reversed[data];
end

text=map(interchange,result)
writedlm("./dicesvalues.txt",result)
writedlm("./chifuyu.txt",text,""); #open txt and change to bold and a strong font for better view ^_^ in some screens its difficult to see :(


