 
 map = [255,245,235
254,230,206
253,208,162
253,174,107
253,141,60
241,105,19
217,72,1
166,54,3
127,39,4];

map = map/256

X = [0.1666666667, 0.1666666667, 0.1666666667, 0.1666666667, 0.1666666667, 0.3333333333, 0.3333333333, 0.3333333333, 0.3333333333, 0.3333333333, 0.5, 0.5, 0.5, 0.5, 0.5, 0.6666666667, 0.6666666667, 0.6666666667, 0.6666666667, 0.6666666667, 0.8333333333, 0.8333333333, 0.8333333333, 0.8333333333, 0.8333333333, 1, 1, 1, 1, 1] ;
Y =[0.9, 0.7, 0.5, 0.3, 0.1, 0.9, 0.7, 0.5, 0.3, 0.1, 0.9, 0.7, 0.5, 0.3, 0.1, 0.9, 0.7, 0.5, 0.3, 0.1, 0.9, 0.7, 0.5, 0.3, 0.1, 0.9, 0.7, 0.5, 0.3, 0.1] ;
Z = [0.4576124567, 0.3463541667, 0.2592105263, 0.08684210526, 0.01578947368, 0.5867117117, 0.4047297297, 0.5872252747, 0.1916666667, 0.03742937853, 0.6808957313, 0.6297709924, 0.4976937269, 0.1694335938, 0.04233067729, 0.7439199791, 0.6925566343, 0.5226628895, 0.2103658537, 0.04048742138, 0.8214059197, 0.7137096774, 0.5690607735, 0.1237046632, 0.02836411609, 0.8026365706, 0.7497126437, 0.6110019646, 0.2253325942, 0.02552816901];

[xx,yy] = meshgrid (linspace (0,1,32));
zz = griddata (X, Y, Z, xx, yy);	
title ("Flit Drop vs. Packet Injection Rate and Fault injection rate");
xlabel ("Packet Injection Rate (0.01)");
ylabel ("Fault Injection Rate (100M fault/s)");
zlabel ("Flit Drop rate");
surf (xx, yy, zz);
colormap(map)
saveas (1, "FI.png");