l = input('Please input the total projected length of axisymmetric hull:');
d = input('Please input the maximum diameter of the hull:');
a = input('Please enter the length of nose section:');
ao = input('Please enter the length of nose offset:');
n = input('Please enter value for nose index:');
b = input('Please enter the length of cylinderical section:');
c = l-a-b;
t = deg2rad(input ('Please enter the angle of tail section (in deg):'));
co = input('Please enter the length of tail offset:');
p = input('Please enter the maximum number of points to plot:');
x1 = 0:(l-ao)/p:a-ao;
x2 = a-ao:(l-ao)/p:a+b;
x3 = a+b:(l-ao)/p:l-ao-co;
y1 = 0.5*d *(1-(x1+ao-a).^2/a^2).^(1/n);
y2 = repmat(0.5*d,1,length(x2));
y3 = (0.5*d) - ((1.5*d/c^2)-(tan(t)/c))*(x3-a-b+ao).^2 + ((d/c^3) - (tan(t)/c^2))*(x3-a-b+ao).^3;
plot(x1,y1,x2,y2,x3,y3)
xy = [x1(:),y1(:);x2(:),y2(:);x3(:),y3(:)];
xyz = [xy, zeros(size(xy,1),1)];
dlmwrite('hullprofilepoints.txt', xyz, 'delimiter', ',');
