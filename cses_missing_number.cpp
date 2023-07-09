#include<iostream>
#include<vector>
#define ll long long
using namespace std;

int main(){
    ll a;
    ll b;
    ll sum;
    ll total;

    cin>>a;
    total=a*(a+1)/2;
    // int arr[a];
    for(ll i=0;i<a-1;i++){
        cin>>b;
        sum=sum+b;
}
    ll answer=total-sum+1;
    cout<<answer;
    
}