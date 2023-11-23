% 保存为 newtonRaphsonExample2.m
function root = newtonRaphsonExample2(x0, tol, maxIter)
    % 牛顿切线法示例：求解 e^(-x^2) + sin(x) = 0
    
    f = @(x) exp(-x^2) + sin(x);
    df = @(x) -2*x*exp(-x^2) + cos(x);
    
    for i = 1:maxIter
        x1 = x0 - f(x0) / df(x0);
        
        if abs(x1 - x0) < tol
            root = x1;
            
            % 作图
            figure;
            x_vals = linspace(-2, 2, 1000);
            y_vals = exp(-x_vals.^2) + sin(x_vals);
            plot(x_vals, y_vals, 'LineWidth', 2);
            hold on;
            plot(root, f(root), 'ro', 'MarkerSize', 10);
            title('牛顿切线法示例');
            xlabel('x');
            ylabel('f(x)');
            grid on;
            hold off;
            
            return;
        end
        
        x0 = x1;
    end
    
    error('未收敛到根，请增加迭代次数或修改初始猜测。');
end
root = newtonRaphsonExample2(1, 1e-6, 100);
