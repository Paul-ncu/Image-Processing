close all;
clear all;
clc;
I1=imread('C:\Users\xiaohao\Desktop\ͼ��������\������Ƭ��ԭʼ��\0189.bmp');
I=medfilt2(I1);
%imwrite(I,'C:\Users\xiaohao\Desktop\ͼ��������\������Ƭ��ԭʼ��\��ֵ�˲�һ.bmp');
h1=[-1 0 1;-2 0 2;-1 0 1];
h2=[1 2 1;0 0 0;-1 -2 -1];
% h3=[0 1 2;-1 0 1;-2 -1 0];
% h4=[1 1 0;2 0 -1;0 -1 -2];
J1=imfilter(I,h1);
J2=imfilter(I,h2);
% J3=imfilter(I,h3);
% J4=imfilter(I,h4);
 J=4*J1+1.5*J2;
 %imwrite(J,'C:\Users\xiaohao\Desktop\ͼ��������\������Ƭ��ԭʼ��\SOBEL1.bmp');
J0=medfilt2(J,[5,5]);
imwrite(J0,'C:\Users\xiaohao\Desktop\ͼ��������\������Ƭ��ԭʼ��\�˲�1.bmp');
figure,imshow(J0);title('��һ����Ե����˲�֮��');
f=im2double(J0);
se=strel('disk',10);
ft=imtophat(f,se);
Thr=graythresh(ft);
lt=imbinarize(ft,Thr);
lt=imclose(lt,se);
%figure,imshow(lt);
at=bwareaopen(lt,300);
figure,imshow(at);title('��һ��ͼ��ֵ');
imwrite(at,'C:\Users\xiaohao\Desktop\ͼ��������\������Ƭ��ԭʼ��\�ɽ���ֵ.bmp');
I1=imread('C:\Users\xiaohao\Desktop\ͼ��������\������Ƭ��ԭʼ��\0190.bmp');
I=medfilt2(I1);
%imwrite(I,'C:\Users\xiaohao\Desktop\ͼ��������\������Ƭ��ԭʼ��\��ֵ�˲���.bmp');
h1=[-1 0 1;-2 0 2;-1 0 1];
h2=[1 2 1;0 0 0;-1 -2 -1];
% h3=[0 1 2;-1 0 1;-2 -1 0];
% h4=[1 1 0;2 0 -1;0 -1 -2];
J1=imfilter(I,h1);
J2=imfilter(I,h2);
% J3=imfilter(I,h3);
% J4=imfilter(I,h4);
J=4*J1+1.5*J2;
%imwrite(J,'C:\Users\xiaohao\Desktop\ͼ��������\������Ƭ��ԭʼ��\SOBEL2.bmp');
J0=medfilt2(J,[5,5]);
imwrite(J0,'C:\Users\xiaohao\Desktop\ͼ��������\������Ƭ��ԭʼ��\�˲�2.bmp');
figure,imshow(J0),title('�ڶ�����Ե����˲�֮��'),impixelinfo;
f=im2double(J0);
se=strel('disk',10);
ft=imtophat(f,se);
Thr=graythresh(ft);
lt=imbinarize(ft,Thr);
lt=imclose(lt,se);
bt=bwareaopen(lt,300);
figure,imshow(bt);title('�ڶ���ͼ��ֵ');
imwrite(bt,'C:\Users\xiaohao\Desktop\ͼ��������\������Ƭ��ԭʼ��\��һ����ֵ.bmp');
K=(at)&(bt);
figure,imshow(K);
%imwrite(K,'C:\Users\xiaohao\Desktop\ͼ��������\������Ƭ��ԭʼ��\��������ֵ.bmp');
K=bwareaopen(K,300);
imwrite(K,'C:\Users\xiaohao\Desktop\ͼ��������\������Ƭ��ԭʼ��\������XIAOC.bmp');
K=bwmorph(K,'thin',Inf);

figure,imshow(K);title('������');
%imwrite(K,'C:\Users\xiaohao\Desktop\ͼ��������\������Ƭ��ԭʼ��\������ϸ��.bmp');
