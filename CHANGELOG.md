## 1.0 - ???

### Features

- `:subform` `RowType`. Tapping this row will push a new form with the information given in the row's `subform` property.
- `:template` `RowType`. This type of row allows you to add more "child" rows according to a specification given in the `:template` key.
- `Formotion::Formable` module for to `include` in models. This adds a `.to_form` method and can be used with a `Formotion::FormableController` to automatically create a form synced to a model.

### Improvements

- `reuseIdentifier` is now based on `#object_id`, so dynamically adding rows at runtime should work.
- Every `RowType` now has an appropriate binding between `row.value` and it's display. So if you have a `StringRow` and change it's `row.value` programmatically, the view will update accordingly.
- `rake spec:units` and `rake spec:functionals` for running tests faster.
- renamed `rowHeight` to `row_height`

### Bug Fixes

- Fixed crash when `form.submit` called without a `on_submit` callback set.
- Add more thorough file dependencies

## 0.5.1 - July 19, 2012

### Improvements

- Add new row type for UIPickerView (:picker)

### Bug Fixes

- Bump required bubble-wrap version to 1.1.2 to fix a `lib` path issue.

## 0.5.0 - July 18, 2012

### Improvements

- Add new row type for images (:image)
- Add new row type for UISegmentedControl (:options)
- Add new row type for UISlider (:slider)
- Add new row type for multiline text (:text)
- Add new row types for dates (:date)
- Big code refactoring