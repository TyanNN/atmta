function peqai() --peq AI
	if peqmode == true then
		if mode == "stalker" then
			love.audio.play(peqflying_st)
		else
			love.audio.play(peqflying)
		end
		peqframes = peqframes+peqspeed
		if iscipa == false then									
			if peqframes < peqrange then
				if peqdirection == 1 then
					peqx = peqx-peqspeed
					if peqx < 0 then peqdirection = 5  end
				elseif peqdirection == 2 then
					peqx = peqx-peqspeed
					peqy = peqy-peqspeed
					if peqx < 0 or peqy < 0 then peqdirection = 6 end
				elseif peqdirection == 3 then
					peqy = peqy-peqspeed
					if peqy < 0 then peqdirection = 7 end
				elseif peqdirection == 4 then
					peqx = peqx+peqspeed
					peqy = peqy-peqspeed
					if peqx > 700 or peqy < 0 then peqdirection = 8 end
				elseif peqdirection == 5 then
					peqx = peqx+peqspeed
					if peqx > 700 then peqdirection = 1 end
				elseif peqdirection == 6 then
					peqx = peqx+peqspeed
					peqy = peqy+peqspeed
					if peqx > 700 or peqy > 555 then peqdirection = 2 end
				elseif peqdirection == 7 then
					peqy = peqy+peqspeed
					if peqy > 555 then peqdirection = 3 end
				elseif peqdirection == 8 then
					peqx = peqx-peqspeed
					peqy = peqy+peqspeed
					if peqx < 0 or peqy > 555 then peqdirection = 4 end
				end
			else
				peqolddirection = peqdirection
				peqdirection = love.math.random(1, 8)
				peqframes = 0
			end
			
		elseif iscipa == true or ispchela == true then	--alert								
			peqspeed = 2	--charging enemy
			if (peqx == cipax+20 and peqy == cipay-20) or (peqx == cipax+21 and peqy == cipay-20)
			or (peqx == cipax+20 and peqy == cipay-21) or (peqx == cipax+21 and peqy == cipay-21) then	--we are close to cipa
				if peqframes > 150 then peqframes = 0 love.audio.play(peqshot)	--hanging in the air for a moment to shoot
				elseif peqframes > 100 then	--enough hanging
					iscipa = false
					ispchela = false
					love.audio.stop(peqshot)
					peqspeed = 1	--returning to normal speed
				end 
			
			elseif peqx > cipax+20 and peqy < cipay-20 then	--enemy is to down-left
				peqdirection = 8
				peqx = peqx-peqspeed
				peqy = peqy+peqspeed
			elseif peqx > cipax+20 and peqy > cipay-20 then	--enemy is to up-left
				peqdirection = 2
				peqx = peqx-peqspeed
				peqy = peqy-peqspeed
			elseif peqx < cipax+20 and peqy > cipay-20 then	--enemy is to up-right
				peqdirection = 4
				peqx = peqx+peqspeed
				peqy = peqy-peqspeed
			elseif peqx < cipax+20 then
				peqdirection = 5
				peqx = peqx+peqspeed
			elseif peqx > cipax+20 then	--enemy is to the left
				peqdirection = 1
				peqx = peqx-peqspeed
			elseif peqy < cipay-20 then
				peqdirection = 6
				peqy = peqy+peqspeed
			elseif peqy > cipay-20 then
				peqdirection = 3
				peqy = peqy-peqspeed
			elseif peqx < cipax+20 and peqy < cipay-20 then
				peqdirection = 6
				peqx = peqx-peqspeed
				peqy = peqy+peqspeed
			end
		end
		else --love.audio.stop(peqflying) love.audio.stop(peqflying_st)	commented, no difference, so dont needed?
		end
end
function timer2() --All da 2nd timer stuff (peq graphics update,bean)
	if timr2==30 then
		if beanframe==1 then
	
			if peqmode == true then
				if (peqx == cipax+20 and peqy == cipay-20) or (peqx == cipax+21 and peqy == cipay-20)
				or (peqx == cipax+20 and peqy == cipay-21) or (peqx == cipax+21 and peqy == cipay-21) then		
					peq = love.graphics.newImage("pequod/shot1.png")
				elseif peqdirection == 4 or peqdirection == 5 or peqdirection == 6 then
					peq = love.graphics.newImage("pequod/peq4.1.png")
				elseif peqdirection == 1 or peqdirection == 2 or peqdirection == 8 then
					peq = love.graphics.newImage("pequod/peq3.1.png")
				elseif peqdirection == 3 or peqdirection == 7 then
					if peqolddirection == 1 or peqolddirection ==  2 or peqolddirection == 8 then
						peq = love.graphics.newImage("pequod/peq1.1.png")
					elseif peqolddirection == 4 or peqolddirection == 5 or peqolddirection == 6 then
						peq = love.graphics.newImage("pequod/peq2.1.png")
					else peq = love.graphics.newImage("pequod/peq1.1.png")
					end
				end
			end
						
		if mode == "mgs" then
		 bean=love.graphics.newImage("mgs/solid.gif")
		elseif mode == "gachimuchi" then
		 bean=love.graphics.newImage("gachimuchi/gachimuchi.png")
		elseif mode == "stalker" then
		 bean=love.graphics.newImage("stalker/stalker.gif")
		else
		 bean=love.graphics.newImage("gosling/gosling.gif")
		end
		beanframe=2
		timr2=0
	 elseif beanframe==2 then
	 
	 	 	---------------------------------------------------------------------------
		if peqmode == true then
			if (peqx == cipax+20 and peqy == cipay-20) or (peqx == cipax+21 and peqy == cipay-20)
			or (peqx == cipax+20 and peqy == cipay-21) or (peqx == cipax+21 and peqy == cipay-21) then		
					peq = love.graphics.newImage("pequod/shot2.png")
			elseif peqdirection == 1 or peqdirection == 2 or peqdirection == 8 then
				peq = love.graphics.newImage("pequod/peq3.2.png")
			elseif peqdirection == 4 or peqdirection == 5 or peqdirection == 6 then
				peq = love.graphics.newImage("pequod/peq4.2.png")
			elseif peqdirection == 3 or peqdirection == 7 then
				if peqolddirection == 1 or peqolddirection ==  2 or peqolddirection == 8 then
					peq = love.graphics.newImage("pequod/peq1.2.png")
				elseif peqolddirection == 4 or peqolddirection == 5 or peqolddirection == 6 then
					peq = love.graphics.newImage("pequod/peq2.2.png")
				else peq = love.graphics.newImage("pequod/peq1.2.png")
				end
			end
		end
		-----------------------------------------------------------------------------
		
		
	   if mode == "mgs" then
	    bean=love.graphics.newImage("mgs/solid2.gif")
	   elseif mode == "gachimuchi" then
	    bean=love.graphics.newImage("gachimuchi/gachimuchi2.png")
	   elseif mode == "stalker" then 
	    bean=love.graphics.newImage("stalker/stalker2.gif")
	   else
	    bean=love.graphics.newImage("gosling/gosling2.gif")
	   end
	   beanframe=1
	   timr2=0
	  end
	 end
end
function timer1() --All da first timer stuff (Bans+,cipa,falling stuff)
	if timr==20 then 
		timr=0
		
		gencipa=love.math.random(0, 150)	--generating cipas, rollers, falling
		
		if     iscipa==true and bans>=1000 and bans<15000 and bans-100>=0 then bans=bans-100 ispchela=false
		elseif iscipa==true and bans<100 and bans<1000 and bans-10>=0 then bans=bans-10 ispchela=false 
		elseif iscipa==true and bans>=15000 and bans<25000 and bans-3000>=0 then bans=bans-1000 ispchela=false
		elseif iscipa==true and bans>=25000 and bans<150000 and bans-5000>=0 then bans=bans-5000 ispchela=false		--block of cipa/roller stealing bans
		elseif iscipa==true and bans>=150000 and bans-50000>=0 then bans=bans-50000 ispchela=true
		elseif iscipa==true and (bans-10<0 or bans==0) and rp-1>=0 then rp=rp-1 ispchela=false 
		elseif rollermode==true and bans-(5000*rp)>=0 then bans=bans-5000*rp end
		
		if iscipa==false then					--shit happens only when no cipa around
			if gencipa==0 then	--then someone gonna steal bans
				if willroller==0 then --maybe its roller?
					rollermode=true
					ispchela=false
					iscipa=false
				end
				iscipa=true
				cipax = love.math.random(300,400)
				cipay = love.math.random(100,300)
				end
			end
			
			if gencipa==1 then				--somethings gonna fall
				if willdio==0 then	--will it be dio?
					isfall=true
					diomode=true
				else
					isfall=true 
				end
			end
			
			if isfall==true then fally=fally+25 end	--falling one frame down
			
			if fally>=700 then					--falled beyond floor
				if diomode==false then	--it was normal falling
					isfall=false
					fally=1
					willdio=love.math.random(0,200) 
				else					--it was me, dio!
					isfall = false
					love.audio.play(dio_end) 
					willdio=love.math.random(0,200) 
					fally=1 
					diomode = false
				end
			end
	
			
			if diomode==false then	--giving bans when no dio falling
				if cats>1 then
					bans=bans+(cats-1)
				end	
				if felixs>1 then
					bans=bans+((felixs-1)*10)
				end
				if bots>1 then
					bans=bans+((bots-1)*50)
				end
				if zoes>1 then
					bans=bans+((zoes-1)*100)
				end
			end
		end
	end