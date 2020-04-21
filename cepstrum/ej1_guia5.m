clear all, close all;

%Establezco parámetros
N = 30;
a = 0.9;
b = 1.2;
alpha = 0.7;
Np = 15;

%Diseño funciones
for n=2:N
    x1(n) = alpha^n;
end

x2 = zeros(1,N);
x2(1) = b;
x2(2) = 1;

x3 = zeros(1,N);
x3(2) = 1;
x3(Np) = alpha;

x = x1 + x2 + x3;

n = -1:N-1-1;

%Cepstrum
c = rceps(x);

figure('units','normalized','outerposition',[0.1 0.2 0.8 0.5])
subplot(1,3,1)
stem(n,x1)
legend('x1')
xlabel('n')
grid
subplot(1,3,2)
stem(n,x2)
legend('x2')
xlabel('n')
grid
subplot(1,3,3)
stem(n,x3)
legend('x3')
xlabel('n')
grid

figure
stem(n,c)
ylabel('cepstrum c(n)')
xlabel('n')
grid