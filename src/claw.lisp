(cl:in-package :skia)

(claw.wrapper:defwrapper (:aw-skia
                          (:system :aw-skia/wrapper)
                          (:defines "SK_GL" 1)
                          (:headers "core/SkCanvas.h"
                                    "core/SkFont.h"
                                    "core/SkSurface.h"
                                    "core/SkRect.h"
                                    "core/SkPaint.h"
                                    "core/SkPoint.h"

                                    "core/SkImageFilter.h"
                                    "core/SkDeferredDisplayList.h"
                                    "core/SkColor.h"
                                    "core/SkColorFilter.h"
                                    "core/SkPathEffect.h"
                                    "core/SkMaskFilter.h"
                                    "core/SkPixelRef.h"
                                    "core/SkPicture.h"
                                    "core/SkImage.h"
                                    "core/SkBitmap.h"

                                    "gpu/GrBackendSurface.h"
                                    "gpu/GrDirectContext.h"
                                    "gpu/gl/GrGLInterface.h"
                                    "gpu/gl/GrGLTypes.h")
                          (:includes :skia-includes :skia-root-includes)
                          (:targets ((:and :x86-64 :linux) "x86_64-pc-linux-gnu")
                                    ((:and :aarch64 :android) "aarch64-linux-android"))
                          (:persistent :aw-skia-bindings
                           :asd-path "../aw-skia-bindings.asd"
                           :bindings-path "../bindings/"
                           :depends-on (:claw-utils))
                          (:language :c++)
                          (:include-sources "core/SkCanvas.h"
                                            "core/SkSurface.h"
                                            "core/SkColor.h"
                                            "core/SkRect.h"
                                            "core/SkPaint.h"
                                            "core/SkPoint.h"

                                            "core/SkSurfaceProps.h"

                                            "gpu/GrBackendSurface.h"
                                            "gpu/GrDirectContext.h"
                                            "gpu/gl/GrGLInterface.h"
                                            "gpu/gl/GrGLTypes.h")
                          (:include-definitions "^sk_sp<.*>"
                                                "^SK_" "^GR_")
                          (:exclude-sources "private/"
                                            "core/SkStream.h"
                                            "core/SkString.h")
                          (:exclude-definitions "__va_list_tag"
                                                "SkFunctionWrapper"
                                                "SkWStream"
                                                "SkBaseDevice"
                                                "GrContextThreadSafeProxy"
                                                "GrGLFunction"
                                                "Mock"
                                                "unique_ptr"
                                                "function<"
                                                "::priv$"
                                                "array.*::"
                                                "sk_sp.*::element_type"
                                                "sk_sp<.*Impl>"
                                                "^Sk.*_DEFINED"
                                                "^Gr.*_DEFINED"))
  :in-package :%skia
  :trim-enum-prefix t
  :recognize-bitfields t
  :recognize-strings t
  :ignore-entities (ignore-uninstantiable)
  :use-float-features t
  :with-adapter (:static
                 :path "lib/adapter.cxx")
  :override-types ((:string claw-utils:claw-string)
                   (:pointer claw-utils:claw-pointer)))
