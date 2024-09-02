"use strict";(self.webpackChunk=self.webpackChunk||[]).push([[9820],{5689:(e,i,t)=>{t.r(i),t.d(i,{assets:()=>l,contentTitle:()=>r,default:()=>h,frontMatter:()=>s,metadata:()=>c,toc:()=>a});var n=t(4848),o=t(8453);const s={title:"Loop Hoisting",description:"Detect opportunities to hoist function calls that are invariant outside of loop bodies for efficiency."},r=void 0,c={id:"checker-loop-hoisting",title:"Loop Hoisting",description:"Detect opportunities to hoist function calls that are invariant outside of loop bodies for efficiency.",source:"@site/versioned_docs/version-1.2.0/checker-loop-hoisting.md",sourceDirName:".",slug:"/checker-loop-hoisting",permalink:"/docs/checker-loop-hoisting",draft:!1,unlisted:!1,tags:[],version:"1.2.0",frontMatter:{title:"Loop Hoisting",description:"Detect opportunities to hoist function calls that are invariant outside of loop bodies for efficiency."},sidebar:"docs",previous:{title:"Liveness",permalink:"/docs/checker-liveness"},next:{title:"Parameter Not Null Checked",permalink:"/docs/checker-parameter-not-null-checked"}},l={},a=[{value:"List of Issue Types",id:"list-of-issue-types",level:2}];function d(e){const i={a:"a",code:"code",h2:"h2",li:"li",p:"p",ul:"ul",...(0,o.R)(),...e.components};return(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)(i.p,{children:"Detect opportunities to hoist function calls that are invariant outside of loop bodies for efficiency."}),"\n",(0,n.jsxs)(i.p,{children:["Activate with ",(0,n.jsx)(i.code,{children:"--loop-hoisting"}),"."]}),"\n",(0,n.jsx)(i.p,{children:"Supported languages:"}),"\n",(0,n.jsxs)(i.ul,{children:["\n",(0,n.jsx)(i.li,{children:"C/C++/ObjC: Yes"}),"\n",(0,n.jsx)(i.li,{children:"C#/.Net: No"}),"\n",(0,n.jsx)(i.li,{children:"Erlang: No"}),"\n",(0,n.jsx)(i.li,{children:"Hack: No"}),"\n",(0,n.jsx)(i.li,{children:"Java: Yes"}),"\n",(0,n.jsx)(i.li,{children:"Python: No"}),"\n"]}),"\n",(0,n.jsxs)(i.p,{children:["This checker detects opportunities to hoist function calls that are invariant to outside of loop bodies. The hoisting analysis relies on ",(0,n.jsx)(i.a,{href:"/docs/checker-purity",children:"purity"})," analysis to determine whether a function is pure or not."]}),"\n",(0,n.jsxs)(i.p,{children:["It has an additional mode that reports ",(0,n.jsx)(i.a,{href:"/docs/all-issue-types#expensive_loop_invariant_call",children:"loop-invariant functions that are expensive"})," (i.e. at least linear). This is enabled by the flag ",(0,n.jsx)(i.code,{children:"--hoisting-report-only-expensive"}),"."]}),"\n",(0,n.jsx)(i.h2,{id:"list-of-issue-types",children:"List of Issue Types"}),"\n",(0,n.jsx)(i.p,{children:"The following issue types are reported by this checker:"}),"\n",(0,n.jsxs)(i.ul,{children:["\n",(0,n.jsx)(i.li,{children:(0,n.jsx)(i.a,{href:"/docs/all-issue-types#expensive_loop_invariant_call",children:"EXPENSIVE_LOOP_INVARIANT_CALL"})}),"\n",(0,n.jsx)(i.li,{children:(0,n.jsx)(i.a,{href:"/docs/all-issue-types#invariant_call",children:"INVARIANT_CALL"})}),"\n"]})]})}function h(e={}){const{wrapper:i}={...(0,o.R)(),...e.components};return i?(0,n.jsx)(i,{...e,children:(0,n.jsx)(d,{...e})}):d(e)}},8453:(e,i,t)=>{t.d(i,{R:()=>r,x:()=>c});var n=t(6540);const o={},s=n.createContext(o);function r(e){const i=n.useContext(s);return n.useMemo((function(){return"function"==typeof e?e(i):{...i,...e}}),[i,e])}function c(e){let i;return i=e.disableParentContext?"function"==typeof e.components?e.components(o):e.components||o:r(e.components),n.createElement(s.Provider,{value:i},e.children)}}}]);