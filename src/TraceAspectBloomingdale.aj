public aspect TraceAspectBloomingdale {
    
    pointcut classToTrace(): within(*App);
    
    pointcut traceGetNameMethods(): classToTrace() && execution(String *.getName());
    
    before(): traceGetNameMethods() {
        System.out.println("[BGN] " + thisJoinPointStaticPart.getSignature() + ", " + 
                           thisJoinPointStaticPart.getSourceLocation().getLine());
    }
    
    after(): traceGetNameMethods() {
        System.out.println("[END] " + thisJoinPointStaticPart.getSourceLocation().getFileName());
    }
}
