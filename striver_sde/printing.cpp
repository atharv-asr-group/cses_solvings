#include <bits/stdc++.h>
using namespace std;


string s,t;
int test,n,cnt;
int count1=0;
int count2=0;
int count3=0;



int count4=0;
int minimum=0;

bool checker(string a, string b){
    if((a.length()%2==1||b.length()%2==1)){
        cnt++;
        if(a==b){
            return true;
        }
        else{
            return false;
        }
    }
    if(a==b){
    return true;
    }
    else{
        string a1=a.substr(0,a.length()/2);
        string a2=a.substr(a.length()/2);
        string b1=b.substr(0,b.length()/2);
        string b2=b.substr(b.length()/2);
        
        for(int i=0;i<a1.length();i++){
            if(a1[i]!=b1[i]){
                count1++;
            }
            if(a2[i]!=b2[i]){count2++;}
            if(a1[i]!=b2[i]){count3++;}
            if(a2[i]!=b1[i]){count4++;}
        }
        if((checker(a1,b1)&&checker(a2,b2))||(checker(a1,b2)&&checker(a2,b1))){
            return true;
        }
        else{
            return false;
        }
    }
    int sum1=count1+count2;
    int sum2=count3+count4;
    minimum=min(sum1,sum2);
}
int main(){
    cin>>test;
    for(int i=0;i<test;i++){
        cin>>n;       
        cin>>s>>t;
        if(n%2==1){
            if(s==t){
                cout<<"YES\n";
            }
            else{
                cout<<"NO\n";
            }
            continue;
        }
    // string a1=s.substr(0,s.length()/2);
    // string a2=s.substr(s.length()/2);
    // string b1=t.substr(0,t.length()/2);
    // string b2=t.substr(t.length()/2);
    if(checker(s,t)){
        cout<<"YES\n";
    }
    else{
        cout<<"NO\n";
    }
 }
 cout<<minimum;
}
