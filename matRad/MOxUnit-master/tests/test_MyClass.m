classdef test_MyClass < matlab.unittest.TestCase
    %TEST_MYCLASS Summary of this class goes here
    %   Detailed explanation goes here
    
    methods (TestClassSetup)
        function addBankAccountClassToPath(testCase)
            p = path;
            testCase.addTeardown(@path,p);
            addpath(fullfile(matlabroot,'help','techdoc','matlab_oop',...
                'examples'));
        end
    end
    
    methods  (Test)
        function testConstructor(testCase)
            
            
            
        value = MyClasses.pi(.001);
        assert(value,3.1416);
        
        
        
        
        X=[0,0.5,1]; 
        Y=X;
        Z=X;
        V = zeros (3,3,3);
        V(:,:,1) = [1 3 5; 3 5 7; 5 7 9];
        V(:,:,2) = V(:,:,1) + 2;
        V(:,:,3) = V(:,:,2) + 2;
        x = [-0.1,0,0.1];
        y = [-0.1,0,0.1]; 
        z = [-0.1,0,0.1];
        vi = matRad_interp3(X,Y,Z,V,x,y,z,'spline');
        vi2= [-0.2, 1.0, 2.2];
        expon = 1e+9;

        assert(length(vi),length(vi2));
        for i = length(vi)
            assert (uint32(vi(i)*expon) == uint32(vi2(i)*expon));
        end
        
        
        
        style = 'extrap';
        xp =   [ 2 3 ]  ; 
        yp =   [ 3 6 3 6; 3 6 3 6] ; 
        xi = [-1, 0, 2.2, 4, 6.6, 10, 11];
        style2 = 1;
        
        mat=[ style2 style2 style2 style2; style2 style2 style2 style2] ;
        assertError(testCase, @() matRad_interp1 (xp',yp',xp',style), 'MATLAB:griddedInterpolant:CompVecValueMismatchErrId');
            vi  = matRad_interp1 (xp, yp, [min(xp)-1, max(xp)+1],style2);
        vi2 = mat;

        for i =  length(vi) 
            assertVectorsAlmostEqual(vi(:,i),vi2(:,i));
        end 

        vi  = matRad_interp1 (xp,yp,xp,style2);
        vi2 = yp;


        for i =  length(vi) 
            assertVectorsAlmostEqual(vi(:,i),vi2(:,i));
        end 



        assert (isequal(matRad_interp1 (xp,yp,xp',style2), yp)) ;
        assert (isequal(matRad_interp1 (xp',yp,xp,style2), yp)) ;

        assert( isequal(matRad_interp1 (xp, yp, [min(xp)-1, max(xp)+1],style2) ,mat ));
        assert (isequal (matRad_interp1 (xp,yp,xp,style2), yp) );
        assert (isequal(matRad_interp1 (xp,yp,xp',style2), yp)) ;
        assert (isequal(matRad_interp1 (xp',yp,xp,style2), yp)) ;
        testCase.assertError(@()assertEqual([1],'a'), 'assertEqual:classNotEqual');
        testCase.assertError( @() matRad_interp1 (xp',yp',xp',style), 'MATLAB:griddedInterpolant:CompVecValueMismatchErrId')
        assertError(testCase, @() matRad_interp1 (xp',yp',xp',style), 'MATLAB:griddedInterpolant:CompVecValueMismatchErrId');
        assert (isempty (matRad_interp1 (xp,yp,[],style2)))  ;
        assertError(testCase, @() matRad_interp1 (xp',yp',[],style2), 'MATLAB:griddedInterpolant:CompVecValueMismatchErrId');
        assertError(testCase, @()  assert (isequal(matRad_interp1 (xp,yp,xi,style2),matRad_interp1 (fliplr(xp),fliplr (yp),xi,style2))), 'MATLAB:griddedInterpolant:NonMonotonicCompVecsErrId');
        assert(matRad_interp1(1,1,1, style2),1);
        assert (isequal(matRad_interp1 (xp,[yp,yp],xi(:),style2),[matRad_interp1(xp,yp,xi(:),style2),matRad_interp1(xp,yp,xi(:),style2)]));
        assertError(testCase, @()  assert(matRad_interp1 (xp,yp,style2,"pp"),xi), 'MATLAB:assertion:LogicalScalar');
        end


    end
end

