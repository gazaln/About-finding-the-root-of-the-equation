function root = compressionIterationImprovedPlot(x0, tol, maxIter)
    % 修正压缩函数法示例：求解 e^(-x^2) + sin(x) = 0
    
    % 定义方程
    f = @(x) exp(-x.^2) + sin(x);
    
    % 初始化数组以保存迭代过程中的点
    iterPoints = zeros(1, maxIter);
    
    for i = 1:maxIter
        x1 = x0 - f(x0);
        
        % 记录当前迭代点
        iterPoints(i) = x1;
        
        % 计算相对误差
        relativeError = abs(x1 - x0) / max(1, abs(x1));
        
        if relativeError < tol
            root = x1;
            
            % 绘图
            plotIteration(iterPoints, f);
            
            return;
        end
        
        x0 = x1;
    end
    
    error('未收敛到根，请增加迭代次数或修改初始猜测。');
end
function plotIteration(iterPoints, f)
    % 绘制迭代过程的图像
    figure;
    
    x_vals = linspace(min(iterPoints) - 1, max(iterPoints) + 1, 1000);
    y_vals = f(x_vals);
    
    plot(x_vals, y_vals, 'LineWidth', 2);
    hold on;
    plot(iterPoints, f(iterPoints), 'ro-', 'MarkerSize', 8, 'LineWidth', 1.5);
    
    title('压缩函数法迭代过程');
    xlabel('x');
    ylabel('f(x)');
    grid on;
    legend('方程曲线', '迭代点');
    hold off;
end
compressionIterationImprovedPlot(0.8, 1e-6, 50)
