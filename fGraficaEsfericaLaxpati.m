function fGraficaEsfericaLaxpati(theta,phi,fcGrafica,colorLaxpati)



% - En escala lineal
figure('Name','Diagrama de radiación (en coordenadas esféricas en escala lineal)');
x = abs(fcGrafica).*sin(theta).*cos(phi);
y = abs(fcGrafica).*sin(theta).*sin(phi);
z = abs(fcGrafica).*cos(theta);
ax = gca;
ax.FontSize = 15;
surf(x,y,z,abs(fcGrafica));
shading interp;
colorLaxpatiGrafica = flipud(colorLaxpati); 
colormap(colorLaxpatiGrafica);
xlim([-1.2 1.2])
ylim([-1.2 1.2])
zlim([0 1.2])
barra = colorbar('Location', 'eastoutside');
set(barra, 'TickLabelInterpreter', 'latex', 'FontName', 'Times New Roman','FontSize', 16);
ylabel(barra,'|AF|','FontSize',18,'FontName','Times New Roman','FontWeight', 'bold');
caxis([0 1]);
title("Diagrama de Radiación",'FontSize', 22,'FontName', 'Times New Roman');
set(ax,'XTickLabel',[], 'YTickLabel', [], 'ZTickLabel', []);
hold on
grid minor
quiver3(-1.2,0,0,1.2,0,0,2,'k','LineWidth',1);
quiver3(0,-1.2,0,0,1.2,0,2,'k','LineWidth',1);
quiver3(0,0,0,0,0,0.6,2,'k','LineWidth',1);
%Eje Z - Escala numérica
text(0,0,1.25,'Z','Color','k','FontSize', 15,'FontName', 'Times New Roman')
% text(-0.04,0.02,0,'0','Color','k','FontSize', 12,'FontName', 'Times New Roman')
% text(-0.04,0.02,0.5,'0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
text(0,0,0.5,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
% text(-0.04,0.02,1,'1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
text(0,0,1,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
text(0,0,0.25,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
text(0,0,0.75,'-','Color','k','FontSize', 12,'FontName', 'Times New Roman')
%Eje Y - Escala numérica
text(-0.09,1,0,'Y','Color','k','FontSize', 15,'FontName', 'Times New Roman')
% text(0.15,-1,0,'- 1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-0.03 0.03],[-1 -1],[0 0],'Color','k','LineWidth',1.1)
% text(0.15,-0.5,0,'- 0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-0.03 0.03],[-0.5 -0.5],[0 0],'Color','k','LineWidth',1.1)
% text(0.15,0.5,0,'0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-0.03 0.03],[0.5 0.5],[0 0],'Color','k','LineWidth',1.1)
% text(0.15,1,0,'1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-0.03 0.03],[1 1],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.03 0.03],[-0.75 -0.75],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.03 0.03],[-0.25 -0.25],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.03 0.03],[0.25 0.25],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.03 0.03],[0.75 0.75],[0 0],'Color','k','LineWidth',1.1)
%Eje X - Escala numérica
text(1.1,-0.25,0,'X','Color','k','FontSize', 15,'FontName', 'Times New Roman')
% text(-1,0.09,0,'- 1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-1 -1],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
% text(-0.5,0.09,0,'- 0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([-0.5 -0.5],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
% text(0.5,0.09,0,'0.5','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([0.5 0.5],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
% text(1,0.09,0,'1','Color','k','FontSize', 16,'FontName', 'Times New Roman')
plot3([1 1],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.75 -0.75],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
plot3([-0.25 -0.25],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
plot3([0.75 0.75],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
plot3([0.25 0.25],[-0.03 0.03],[0 0],'Color','k','LineWidth',1.1)
view(141.7217, 39.9798);