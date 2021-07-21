; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-apple-macosx10.14.0 -mattr=mmx | FileCheck %s

define i32 @foo(i32 %a) {
; CHECK-LABEL: foo:
; CHECK:       ## %bb.0: ## %entry
; CHECK-NEXT:    ## InlineAsm Start
; CHECK-NEXT:    movd %edi, %mm0
; CHECK-NEXT:    ## InlineAsm End
; CHECK-NEXT:    movd %mm0, %eax
; CHECK-NEXT:    retq
entry:
  %0 = tail call i32 asm sideeffect "movd    $1, $0", "=y,r,~{dirflag},~{fpsr},~{flags}"(i32 %a)
  ret i32 %0
}
