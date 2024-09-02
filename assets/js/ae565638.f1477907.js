"use strict";(self.webpackChunk=self.webpackChunk||[]).push([[2380],{8921:(e,t,i)=>{i.r(t),i.d(t,{assets:()=>l,contentTitle:()=>o,default:()=>p,frontMatter:()=>r,metadata:()=>c,toc:()=>a});var s=i(4848),n=i(8453);const r={title:"Impurity",description:'Detects functions with potential side-effects. Same as "purity", but implemented on top of Pulse.'},o=void 0,c={id:"checker-impurity",title:"Impurity",description:'Detects functions with potential side-effects. Same as "purity", but implemented on top of Pulse.',source:"@site/versioned_docs/version-1.1.0/checker-impurity.md",sourceDirName:".",slug:"/checker-impurity",permalink:"/docs/1.1.0/checker-impurity",draft:!1,unlisted:!1,tags:[],version:"1.1.0",frontMatter:{title:"Impurity",description:'Detects functions with potential side-effects. Same as "purity", but implemented on top of Pulse.'},sidebar:"docs",previous:{title:"Immutable Cast",permalink:"/docs/1.1.0/checker-immutable-cast"},next:{title:"Inefficient keySet Iterator",permalink:"/docs/1.1.0/checker-inefficient-keyset-iterator"}},l={},a=[{value:"List of Issue Types",id:"list-of-issue-types",level:2}];function u(e){const t={a:"a",code:"code",h2:"h2",li:"li",p:"p",ul:"ul",...(0,n.R)(),...e.components};return(0,s.jsxs)(s.Fragment,{children:[(0,s.jsx)(t.p,{children:'Detects functions with potential side-effects. Same as "purity", but implemented on top of Pulse.'}),"\n",(0,s.jsxs)(t.p,{children:["Activate with ",(0,s.jsx)(t.code,{children:"--impurity"}),"."]}),"\n",(0,s.jsx)(t.p,{children:"Supported languages:"}),"\n",(0,s.jsxs)(t.ul,{children:["\n",(0,s.jsx)(t.li,{children:"C/C++/ObjC: Experimental"}),"\n",(0,s.jsx)(t.li,{children:"Java: Experimental"}),"\n",(0,s.jsx)(t.li,{children:"C#/.Net: Experimental"}),"\n"]}),"\n",(0,s.jsxs)(t.p,{children:["This is an experimental inter-procedural analysis that detects impure functions. It is meant to be an improvement over the ",(0,s.jsx)(t.a,{href:"/docs/1.1.0/checker-purity",children:"purity"})," analysis with a negation on the issue types. For each function, impurity analysis keeps track of not only the impurity of the function but also some additional information such as which parameters/globals the function modifies. It models functions with no summary/model as impure. The analysis relies on ",(0,s.jsx)(t.a,{href:"/docs/1.1.0/checker-pulse",children:"Pulse"})," summaries to determine impurity."]}),"\n",(0,s.jsx)(t.h2,{id:"list-of-issue-types",children:"List of Issue Types"}),"\n",(0,s.jsx)(t.p,{children:"The following issue types are reported by this checker:"}),"\n",(0,s.jsxs)(t.ul,{children:["\n",(0,s.jsx)(t.li,{children:(0,s.jsx)(t.a,{href:"/docs/1.1.0/all-issue-types#impure_function",children:"IMPURE_FUNCTION"})}),"\n",(0,s.jsx)(t.li,{children:(0,s.jsx)(t.a,{href:"/docs/1.1.0/all-issue-types#modifies_immutable",children:"MODIFIES_IMMUTABLE"})}),"\n"]})]})}function p(e={}){const{wrapper:t}={...(0,n.R)(),...e.components};return t?(0,s.jsx)(t,{...e,children:(0,s.jsx)(u,{...e})}):u(e)}},8453:(e,t,i)=>{i.d(t,{R:()=>o,x:()=>c});var s=i(6540);const n={},r=s.createContext(n);function o(e){const t=s.useContext(r);return s.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function c(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(n):e.components||n:o(e.components),s.createElement(r.Provider,{value:t},e.children)}}}]);