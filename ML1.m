x = load('ex2x.dat');
y = load('ex2y.dat');
plot(x,y,'o');
x = [ones(50,1), x];

%part 1
theta = zeros(2,1);
theta = theta - (0.07/50)*x'*(x*theta -y)
theta
%part 2
theta = zeros(2,1);
for i = 1:1500
theta = theta - (0.07/50)*x'*(x*theta -y);
end
theta


hold on
plot(x(:,2), x*theta, '-');
legend('Training data', 'Linear regression');

%part 3
z = 3.5*theta(2) - theta(1);
zz = 7*theta(2) - theta(1);

%3d plot
jvals = zeros(100, 100);
theta1 = linspace(-3,3,100);
theta2 = linspace(-1,1,100);
for i = 1:length(theta1)
	for j = 1:length(theta2)
	t = [theta1, theta2];
	jvals(i,j) = (1/100) * sum((x *t' -y).^2);
	end
end

jvals = jvals';
figure;
surf(theta1, theta2, jvals);
xlabel('theta1');
ylabel('theta2');