typedef WidgetDataExporter<T extends Object> = void Function(T object)?;
typedef FlexibleProcessor<T extends Object, R extends Object> = R Function(T object);
typedef WidgetDataExporterNullable<T extends Object> = void Function(T? object)?;
