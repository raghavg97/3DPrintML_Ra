function y = cvar(G) %Coefficient of variation
 
y = std2(G)/ mean2(G);

end