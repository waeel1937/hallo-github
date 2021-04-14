classdef MyClasses
    %TEST_CLASS Summary of this class goes here
    %   Detailed explanation goes here
    
   methods(Static)
       function p = pi(tol)
           [n d] = rat(pi,tol);
           p = n/d;
       end
   end
end


