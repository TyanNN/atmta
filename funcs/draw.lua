function init() --All da basic drawing & bean
	
	if mode == "stalker" then					--riba
		love.graphics.draw(b_goldfish, 784, 584)
	elseif mode == "spooky" then
		love.graphics.draw(b_flowey,784,584)
	else
		love.graphics.draw(riba, 784, 584)
	end
	
	if mode ~= "spooky" then					--bean/pumpkin, sans?
		love.graphics.draw(bean,300,300)
		if issans == true then
			anim_scorp:draw(img_scorp, 1, 410 )
		end
	else
		anim_pumpkin:draw(pumpkin, 450, 420)
		anim_skel_doom:draw(img_skel_doom, 250, 450)
		if issans == true then
			love.window.setTitle("GRIB GROB KREST KREST KLADBISCHE METTATON")
		end
	end
	
	if mode == "stalker" then					--top left info text
		love.graphics.setColor(224,150,0)
		love.graphics.print("Gop-stop: "..bans,150,1)
		love.graphics.print("Habar: "..rp,160,550)
	else
		if mode == "spooky" then
			love.graphics.setColor(255,0,0)
		else
			love.graphics.setColor(0, 0, 0)
		end
		love.graphics.print("Banned: "..bans,150,1)
		love.graphics.print("MEMES: "..rp,160,550)
	end
	love.graphics.print("ATMTA Clicker 1.0S",1,1)
	love.graphics.print(50*rp.." : "..(50*rp)*10,170,538)
	love.graphics.setColor(255,255,255)
	
	if mode == "stalker" then	--BAN
		love.graphics.draw(b_shmonat, 1, 20)
	else
		love.graphics.draw(ban_b,1,20)
	end
	
	love.graphics.draw(b_shop, 765,470)
	
	love.graphics.draw(b_instant, 805, 450)
	if instant_pr == true then
		love.graphics.draw(b_instant_pr, 805, 450)
	end
	
end

--[[	testing without it
function windowTitles() --Window titles
	if mode == "mgs" then
		--love.window.setTitle("A Hideo Kojima Game")
	elseif mode == "gachimuchi" then
		love.window.setTitle("Boy♂Next♂Door♂ ")
	elseif mode == "stalker" then
		love.window.setTitle("ANYY CHEEKI BREEKI I V DAMKEE")
	elseif mode == "spooky" then
		love.window.setTitle("Spooky Scary ATMTA")
	else
		love.window.setTitle("ATMTA")
	end
end
]]
function greyButtons() --All gray buttons are here
	love.graphics.setColor(133,133,133)
	if mode == "stalker" then
		love.graphics.draw(b_pm, 805, 80)
		love.graphics.draw(b_mp5, 805, 140)
		love.graphics.draw(b_kalash, 805, 202)
		love.graphics.draw(b_vss, 805, 263)
		love.graphics.draw(b_shelupon, 1, 538)
	else
		love.graphics.draw(atmta,805,80)
		love.graphics.draw(felix,805,140)
		love.graphics.draw(bot_b,805,202)
		love.graphics.draw(zoe,805,263)
		love.graphics.draw(forcememe,1,538)
	end
	
	if peqmode == false then love.graphics.draw(callpeq, 805, 325) end	--buy a heli button
	
	if ispruglo==false then
		love.graphics.setColor(133, 133, 133)
		love.graphics.draw(pruglo,1050,450)
		love.graphics.setColor(255, 255, 255)
		love.graphics.print("500",1120,420)
	elseif ispruglo==true and isuvarov==false then
		love.graphics.setColor(133, 133, 133)
		love.graphics.draw(uvarov,1050,450)
		love.graphics.setColor(255, 255, 255)
		love.graphics.print("2500",1110,420)
	elseif isuvarov==true and isnomad==false then
		love.graphics.setColor(133, 133, 133)
		love.graphics.draw(nomad,1050,450)
		love.graphics.setColor(255, 255, 255)
		love.graphics.print("10000",1110,420)
	elseif isnomad==true and isjontron==false then
		love.graphics.setColor(133, 133, 133)
		love.graphics.draw(jontron,1050,450)
		love.graphics.setColor(255, 255, 255)
		love.graphics.print("50000",1110,420)
	elseif isjontron==true and iswho==false then
		love.graphics.setColor(133, 133, 133)
		love.graphics.draw(who_b,1050,450)
		love.graphics.setColor(255, 255, 255)
		love.graphics.print("250000",1100,420)
	end
end
function fallcheck() --Drawing fallin things~
	if isfall==true then
		if diomode == true then
			love.graphics.draw(dio, fallx, fally)
		elseif mode == "mgs" then
			love.graphics.draw(fallingmgs,fallx,fally)
		elseif mode == "stalker" then
			love.graphics.draw(fallingstl,fallx,fally)
		elseif mode == "spooky" then
			love.graphics.draw(icon_fallingtrumpet,fallx,fally)
		elseif mode == "gachimuchi" then
			love.graphics.draw(fallinggachimuchi,fallx,fally)
		else
			love.graphics.draw(fallingyee,fallx,fally)
		end
	end
end


function buttons() --All clickable buttons & their prices~ are here
	love.graphics.setColor(255, 255, 255)
	if rp>=2 then							--catprice
		love.graphics.print(10*rp*cats.." : "..cats-1,975 ,80)	--170
	end
	if rp>=3 then 							--felixprice
		love.graphics.print(50*rp*felixs.." : "..felixs-1,975,140)
	end
	if rp>=10 then 							--botprice
		love.graphics.print(100*rp*bots.." : "..bots-1,975,200)
	end
	if rp>=15 then 							--zoeprice
		love.graphics.print(300*rp*zoes.." : "..zoes-1,975,260)
	end
	
	love.graphics.setColor(255,255,255)	--all event below are colorful
	if bans>=(10*rp*cats) and rp>=2 then	--colorful cat
		
		if mode == "stalker" then
			love.graphics.draw(b_pm, 805, 80)
		else
			love.graphics.draw(atmta,805,80)
		end
	end
	if bans>=(50*rp*felixs) and rp>=3 then	--colorful felix
		if mode == "stalker" then
			love.graphics.draw(b_mp5, 805, 140)
		else
			love.graphics.draw(felix,805,140)
		end
	end
	if bans>=(100*rp*bots) and rp>=10 then	--colorful bot
		if mode == "stalker" then
			love.graphics.draw(b_kalash, 805, 202)
		else
			love.graphics.draw(bot_b,805,202)
		end
	end
	if bans>=(300*rp*zoes) and rp>=15 then	--colorful zoe
		if mode == "stalker" then
			love.graphics.draw(b_vss, 805, 263)
		else
			love.graphics.draw(zoe,805,263)
		end
	end
	
	
	if bans>=500 and rp>=5 and ispruglo==false then
		love.graphics.draw(pruglo,1050,450)
	end
	if bans>=2500 and rp>=15 and isuvarov==false and ispruglo==true then
		love.graphics.draw(uvarov,1050,450)
	end
	if bans>=10000 and rp>=25 and isnomad==false and isuvarov==true then
		love.graphics.draw(nomad,1050,450)
	end
	if bans>=50000 and rp>=50 and isjontron==false and isnomad==true then
		love.graphics.draw(jontron,1050,450)
	end
	if bans>=250000 and rp>=100 and isjontron==true and iswho==false then
		love.graphics.draw(who_b,1050,450)
	end
	
	if bans>=50*rp then	--colorful meme
		if mode == "stalker" then
			love.graphics.draw(b_shelupon, 1, 538)
		else
			love.graphics.draw(forcememe, 1, 538)
		end
	end
	
	if bans>=150000 and peqmode == false then	--colorful peq
		love.graphics.draw(callpeq, 805, 325)
	end
end