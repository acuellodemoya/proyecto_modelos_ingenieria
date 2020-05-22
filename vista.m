function varargout = vista(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vista_OpeningFcn, ...
                   'gui_OutputFcn',  @vista_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

function vista_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = vista_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function res_1_Callback(hObject, eventdata, handles) %resistencia 1
handles.res_1 = str2double(get(hObject,'String')); 
guidata(hObject,handles);

function res_1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function res_2_Callback(hObject, eventdata, handles) %resistencia 2
handles.res_2 = str2double(get(hObject,'String'));
guidata(hObject,handles);

function res_2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function cap_Callback(hObject, eventdata, handles) %capacitancia 1
handles.cap = str2double(get(hObject,'String'));
guidata(hObject,handles);

function cap_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ind_Callback(hObject, eventdata, handles) %inductancia
handles.ind = str2double(get(hObject,'String'));
guidata(hObject,handles);

function ind_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function cap_2_Callback(hObject, eventdata, handles)  %capacitancia 2
handles.cap_2 = str2double(get(hObject,'String'));
guidata(hObject,handles);

function cap_2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function res_3_Callback(hObject, eventdata, handles) %resistencia 3

handles.res_3 = str2double(get(hObject,'String'));
guidata(hObject,handles);

function res_3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function btn_ft_Callback(hObject, eventdata, handles)
n=get(handles.num,'string')
d=get(handles.den,'string')
if(strlength(n) <= 7 && strlength(d) <= 7)
    num=eval(n)
    den=eval(d)
    p=tf(num,den)
    p=evalc('p')
    set(handles.show_ft,'String',p)
else
    msgbox('El numerador o denominador debe ser menor o igual a grado 2');
end

function show_ft_Callback(hObject, eventdata, handles)

function show_ft_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function polos_CreateFcn(hObject, eventdata, handles)

function zeros_CreateFcn(hObject, eventdata, handles)

function btn_po_ze_Callback(hObject, eventdata, handles)
set(handles.zeros,'String',roots(handles.num));
r =roots(handles.den);
disp(r);
set(handles.polos,'String',roots(handles.den));

function btn_mpz_Callback(hObject, eventdata, handles)
figure;
pzmap(handles.fts);

function btn_est_Callback(hObject, eventdata, handles)
poles = roots(handles.den); %guardo los polos en una variable
x = find(poles > 0); % busco si existe un elemento en los polos que sea mayor que 0
tam = length(x); % guardo el tamaño del vector donde guarde las posiciones de los  elementos que sean mayor a 0 en los  polos
if(tam == 0)  % si el tam es mayor a 0 determinamos que existe un polo positivo lo cual determina que el sistea es inestable
   warndlg('el sistema es estable'); %creamos una alerta con el mensaje
else
    warndlg('el sistema es inestable'); 
end

function btn_gra_r_Callback(hObject, eventdata, handles)
%agregamos un 0 al denominador para crear la grafica con repecto a una
%entrada rampa
den2 = handles.den;
den2(length(den2)+1) = 0;
%agregamos un 0 al denominador de rampa para crear la grafica con repecto a una
%entrada parabolica
den3 = den2;
den3(length(den3)+1) = 0;
figure(1); % creamos una figura para que no salga ensima de la guide
step(handles.fts); %graficamos con respecto a una estrada escalon
title('grafica con respecto a una entrada escalon');
figure(2);
step(tf(handles.num,den2)); %graficamos con respecto a una estrada rampa
title('grafica con respecto a una entrada rampa');
figure(3);
step(tf(handles.num,den3)); %graficamos con respecto a una estrada parabolica
title('grafica con respecto a una entrada parabolica');

function btn_error_Callback(hObject, eventdata, handles)
poles = roots(handles.den); 
x = find(poles > 0); 
tam = length(x); 
if(tam > 0) 
   warndlg('el sistema es inestable, por tanto no se puede hallar el error'); 
else
     Eeep = polyval(handles.den,0)/ (polyval(handles.den,0) + (polyval(handles.num,0)));
     set(handles.eeep,'String',Eeep);
     set(handles.eeev,'String','infinito');
     set(handles.eeea,'String','infinito');
end

function eeep_Callback(hObject, eventdata, handles)

function eeep_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function eeev_Callback(hObject, eventdata, handles)

function eeev_CreateFcn(hObject, eventdata, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function eeea_Callback(hObject, eventdata, handles)

function eeea_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function btn_amor_Callback(hObject, eventdata, handles)
D=handles.den;
N= handles.num;
figure(5)
disp('Funcion de transferencia:');
fprintf('\n\n');
if D~=1
D1 = D/D(1);
 N1 = N/D(1);
else
 D1 = D;
 N1 = N;
end
printsys(N1,D1);
Wn=sqrt(D1(3));
Z=(D1(2)/(2*Wn));
fprintf('\n\n');
 if (Z<0)
 str='El Sistema Presenta Amortiguamiento Negativo';
 set( handles.amortiguamientoV , 'string', num2str(str))
 step(N,D);
 else
 if (Z==0)
 str='El Sistema No Presenta Amortiguamiento';
 set( handles.amortiguamientoV , 'string', num2str(str))
 step(N,D);
 else
 if (Z==1)
 str='El Sistema Tiene un Amortiguamiento Critico';
 set( handles.amortiguamientoV , 'string', num2str(str))
 step(N,D);
 else
 if (Z>1)
 str='El Sistema es Sobreamortiguado';
 set( handles.amortiguamientoV , 'string', num2str(str))
 step(N,D);
 else
 if (0<=Z<=1)
 str='El Sistema es Subamortiguado';
 set( handles.amortiguamientoV , 'string', num2str(str))
 step(N,D);
 fprintf('\n\n');

 %Tiempo de Asentamiento
 if (0<Z<0.69)
 Ts=((3.2)/(Z*Wn));
 set( handles.asentamientoV , 'string', num2str(Ts))
 end
 if (Z>0.69)
 Ts=((4.53)/(Wn));
   set( handles.asentamientoV , 'string', num2str(Ts))
 end
 fprintf('\n\n');

 %Sobrepaso
 Sp=((100)*(exp((-pi*Z)/(sqrt(1-Z^2)))));
 set(handles.sobrepasoV , 'string', num2str(Sp))
 end
 end
 end
 end
 end

function kse_Callback(hObject, eventdata, handles)

function kse_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function btn_k_Callback(hObject, eventdata, handles)
cap = handles.cap;
cap2 = handles.cap_2;
res1 = handles.res_1;
res2 = handles.res_2;
res3 = handles.res_3;
ind = handles.ind;
x = (1/res1)/(cap+((res3*cap)/res2)+((res3*cap2)/res2));
y = (res3/ind)/((res2*cap)+(res3*cap)+(res3*cap2));
kfinal = -y/x;
set(handles.kse,'String',kfinal);%seteamos la caja de texto donde muestro las dos k

function amortiguamientoV_CreateFcn(hObject, eventdata, handles)

function asentamientoV_CreateFcn(hObject, eventdata, handles)

function text26_CreateFcn(hObject, eventdata, handles)

function varFase_Callback(hObject, eventdata, handles)
% hObject    handle to varFase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function varFase_CreateFcn(hObject, eventdata, handles)
% hObject    handle to varFase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','blue');
end



function num_Callback(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num as text
%        str2double(get(hObject,'String')) returns contents of num as a double


% --- Executes during object creation, after setting all properties.
function num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function den_Callback(hObject, eventdata, handles)
% hObject    handle to den (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of den as text
%        str2double(get(hObject,'String')) returns contents of den as a double


% --- Executes during object creation, after setting all properties.
function den_CreateFcn(hObject, eventdata, handles)
% hObject    handle to den (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
